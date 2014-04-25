#!/usr/bin/env ruby
#____________________________________________________________________
# File: navigator.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-24 11:20:23+0200
# Revision: $Id$
# Description: Class to handle extracting navigation block from a results page.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------

require 'job_up/page_error'

module JobUp
  module Page

    class Navigator

      require 'cgi'
      require 'open-uri'

      def initialize(doc)
        @nav_block
        @pagecount=nil
        @job_uri=Array.new

        begin
          if doc.instance_of?(Nokogiri::HTML::Document)
            # Extract the navigation block:
            nav_block_nav_last='//*[@id="nav_last"]'

            # Since there will be 2 blocks (for the top and bottom nav bars), we
            # select just the top one (the first element):
            @nav_block = doc.xpath(nav_block_nav_last)[0]

            # Check to see if we actually have the nav block. If it's nil then
            # there were fewer pages so no nav bar wrapping required:
            if @nav_block.nil?
              # Proceed to redo the nav block search:

            end
            # Decode the URI (from the href value):
            href_str = URI.decode(@nav_block.attribute("href").text)

            # Extract the param components of the URI and find the param "p"
            # to get the page number. Then convert the string to integer:
            params=CGI.parse(href_str)

            @pagecount = params['p'][0].to_i
          else
            raise PageError, "Got unexpected document type: #{doc.class}"
          end
        rescue => err
          $stderr.print("ERROR: No Nokogiri::HTML::Document object received. Unable to parse.")
        end
      end

      attr_reader :pagecount

    end
  end
end
