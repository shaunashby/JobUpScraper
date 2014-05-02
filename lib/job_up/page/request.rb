#!/usr/bin/env ruby
#____________________________________________________________________
# File: request.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-26 00:37:35+0200
# Revision: $Id$
# Description: Class to manage a request for a URL and permit access 
#              to the contained elements.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'nokogiri'
require 'open-uri'

require 'job_up/page/content'

module JobUp
  module Page
    class Request
      def initialize(base_url)
        @base_url = base_url
        @pages = Array.new
      end

      def get_page_content(query_params)
        url = @base_url + query_params
        cookie = nil
        main_doc = nil

        begin
          main_doc = open(url)
          # The meta method is only included in the OpenURI module
          # when the input is a URL, not a file:
          if main_doc.respond_to? :meta
            if cookie.nil?
              cookie = main_doc.meta['set-cookie'].split('; ',2)[0]
            end
          end

          html_doc = Nokogiri::HTML(main_doc)
          pagenav = JobUp::Page::Navigator.new(html_doc)

          # Save the first landing page:
          @pages << JobUp::Page::Content.new(html_doc)

          # Retrieve each of the linked pages and store the Page::Content object.
          # Only do this for a real URL (i.e. not for testing):
          if main_doc.respond_to? :meta
            (2..pagenav.pagecount).each do |pnum|
              @pages << JobUp::Page::Content.new( Nokogiri::HTML( open(url + sprintf("&p=%d",pnum), 'Cookie' => cookie ) ))
            end
          end
        rescue => err
          $stderr.print("ERROR: #{err}.\n")
        end
      end

      attr_reader :pages

    end
  end
end
