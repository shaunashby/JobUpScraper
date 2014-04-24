#!/usr/bin/env ruby
#____________________________________________________________________
# File: search.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-24 11:23:37+0200
# Revision: $Id$
# Description: Class to manage a URL-based search.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'nokogiri'
require 'open-uri'

require 'jobup/page/navigation'

module JobUp

  SEARCH_DIV_SEARCH_CONTENT_MAIN_TABLE_XPATH      ='//*[@id="search_content"]/div/table'
  SEARCH_DIV_SEARCH_CONTENT_MAIN_TABLE_BODY_XPATH ='//*[@id="search_content"]/div/table/tbody'

  SEARCH_LABEL_RESULT_COUNT_XPATH = '//*[@id="label_result_count"]'
  SEARCH_NAV_BLOCK_NAV_LAST       = '//*[@id="nav_last"]'
  SEARCH_OL_JOBS_LIST_XPATH       = '//*[@id="jobs_list"]/li/div'

  class Search
    def initialize(url)
      @doc = nil

      begin
        @doc = Nokogiri::HTML(open(@url))
      rescue => err
        $stderr.print "ERROR: Unable to open URL #{url} - #{err}"
      end
    end

    def go()
      # Number of posts found:
      n_posts_result_text = @doc.xpath(SEARCH_LABEL_RESULT_COUNT_XPATH).text
      # Strip out the first element (which is numerical):
      n_posts = n_posts_result_text.split(/ /)[0]
    end

    attr_reader :doc

    private
    def navigation
      # Since there will be 2 blocks (for the top and bottom nav bars), we
      # select just the first one:
      nav = @doc.xpath(SEARCH_NAV_BLOCK_NAV_LAST)[0]
      # Decode the URI (from the href attribute value):
      href_str = URI.decode(nav.attribute("href").text)
      # Extract the param components of the URI:
      params=CGI.parse(href_str)
      # The number of pages equals the last page number:
      n_pages = params['p'][0].to_i
    end
  end

end
