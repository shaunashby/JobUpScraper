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
          doc = Nokogiri::HTML(@main_doc)
          page = JobUp::Page::Content.new(doc)
          page_nav = page.getNav()
          return page
        rescue => err
          $stderr.print("Unable to open URL #{url} - #{err}.")
        end
      end
    end
  end
end
