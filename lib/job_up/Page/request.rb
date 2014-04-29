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

          doc = Nokogiri::HTML(@main_doc)
          page = JobUp::Page::Content.new(doc)
          # Save the first page:
          @pages.push(page)
          # From the page navigation we can build a list of sub-queries and retrieve
          # each of the subsequent pages:
          (2..page.get_nav().pagecount).each do |pnum|
            subquery = sprintf("%s&p%d", url, pnum)
            doc = Nokogiri::HTML(open(url,'Cookie' => @cookie))
            @pages << JobUp::Page::Content.new(doc)
          end

          return page
        rescue => err
          $stderr.print("ERROR: #{err}.\n")
        end
      end
    end
  end
end
