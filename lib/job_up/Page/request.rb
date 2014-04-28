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
        @subpage_urls = Array.new
        @cookie = ""
      end

      def getPageContent(query_params, pagenum = 1)
        @pagenum = pagenum
        url = @base_url + query_params

        begin
          @main_doc = open(url)
          if @main_doc.respond_to? :meta
            @cookie = @main_doc.meta['set-cookie'].split('; ',2)[0]
          end

          doc = Nokogiri::HTML(@main_doc)
          page = JobUp::Page::Content.new(doc)
          page_nav = page.getNav()
          # From the page navigation we can build a list of sub-queries for each
          # of the subsequent pages:
          (2..page_nav.pagecount).each do |pnum|
            @subpage_urls << sprintf("%s&p%d", query_params, pnum)
          end

          return page
        rescue => err
          $stderr.print("ERROR: #{err}.\n")
        end
      end
    end
  end
end
