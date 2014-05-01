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
        @main_doc = nil
        @cookie = nil
        @pages = Array.new
      end

      def get_page_content(query_params)
        url = @base_url + query_params

        begin
          if @main_doc.nil?
            @main_doc = open(url)
            if @main_doc.respond_to? :meta
              if @cookie.nil?
                @cookie = @main_doc.meta['set-cookie'].split('; ',2)[0]
              end
            end
          end

          page = JobUp::Page::Content.new( Nokogiri::HTML(@main_doc) )
          npages = page.get_nav.pagecount

          # Save the first page:
          @pages << page 

          # Retrieve each of the linked pages and store the Page::Content object:
          (2..npages).each do |pnum|
            @pages << JobUp::Page::Content.new( Nokogiri::HTML( open(url + sprintf("&p=%d",pnum), 'Cookie' => cookie ) ))
          end
        rescue => err
          $stderr.print("ERROR: #{err}.\n")
        end
      end

      attr_reader :pages

    end
  end
end
