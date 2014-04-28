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

      SEARCH_NAV_BLOCK                = '//*[@id="navigator"]'
      SEARCH_NAV_BLOCK_NAV_LAST       = '//*[@id="nav_last"]'
      SEARCH_NAV_BLOCK_C_LINK         = 'a[@class="C_LINK"]'

      require 'cgi'
      require 'open-uri'

      def initialize(doc)
        @nav_block=nil
        @pagecount=nil
        @job_uri=Array.new

        begin
          if doc.instance_of?(Nokogiri::HTML::Document)
            # Extract the navigation block which contains the arrows to move forward,
            # backwards or jump to the last page. Select the first element returned
            # (for the top nav):
            @nav_block=doc.xpath(SEARCH_NAV_BLOCK)[0]
            if @nav_block.nil?
              # There was a serious problem. Barf.
              raise NavError, "Unable to search for xpath = #{SEARCH_NAV_BLOCK}."
            end

            # Extract the nav_last <a> tag which holds the page number reference.
            # Select the first nav_last ID in the nav block:
            @nav_block_nav_last = doc.xpath(SEARCH_NAV_BLOCK_NAV_LAST)[0]
            # Check to see if we actually have the nav block. If it's nil then
            # there were fewer pages so no nav bar wrapping required:
            if @nav_block_nav_last.nil?
              # Proceed to redo the nav block search
              # Count the number of C_LINK <a> tags in the navigation block, then
              # get the last <a> tag to extract the page number.
              nav_c_links = @nav_block.xpath(SEARCH_NAV_BLOCK_C_LINK)
              # If there aren't any <a> tags with the C_LINK class then we only have
              # one page of results (the first page returned):
              if nav_c_links.empty?
                @pagecount = 1
              else
                # Determine the page count using the last <a> tag (which has
                # the page number of the last page as a parameter):
                @pagecount = getPageNumFromLink(nav_c_links.last)
              end
            else
              @pagecount = getPageNumFromLink(@nav_block_nav_last)
            end
          else
            raise PageError, "Unexpected document type: #{doc.class}."
          end
        rescue => err
          $stderr.print("ERROR: #{err}.\n")
        end
      end

      attr_reader :pagecount

      private

      def getPageNumFromLink(link)
        # Decode the URI (from the href value) and extract the param
        # components of the URI:
        params=CGI.parse(  URI.decode(link.attribute("href").text) )
        # Find the param "p" to get the page number, convert the string
        # to integer:
        return params['p'][0].to_i
      end

    end
  end
end
