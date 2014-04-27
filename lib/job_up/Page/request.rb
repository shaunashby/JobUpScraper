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

require 'job_up/page/content'

module JobUp
  module Page
    class Request
      def initialize(base_url)
        @base_url = base_url
      end

      def getPageContent(query_params)
        url = @base_url + query_params

        begin
          @doc = Nokogiri::HTML(open(url))

          page = JobUp::Page::Content.new(@doc)
          page_nav = page.getNav()

        rescue => err
          $stderr.print("Unable to open URL #{url} - #{err}.")
        end
      end
    end
  end
end
