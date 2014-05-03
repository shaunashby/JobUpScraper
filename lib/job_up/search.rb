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

require 'job_up/page/request'

module JobUp
  # FIXME: move constants to separate module
  SEARCH_DIV_SEARCH_CONTENT_MAIN_TABLE_XPATH      ='//*[@id="search_content"]/div/table'
  SEARCH_DIV_SEARCH_CONTENT_MAIN_TABLE_BODY_XPATH ='//*[@id="search_content"]/div/table/tbody'

  SEARCH_NAV_BLOCK                = '//*[@id="navigator"]'
  SEARCH_NAV_BLOCK_NAV_LAST       = '//*[@id="nav_last"]'
  SEARCH_OL_JOBS_LIST_XPATH       = '//*[@id="jobs_list"]'
  SEARCH_OL_JOBS_LIST_LINKS_XPATH = '//*[@id="jobs_list"]/li/div'

  SEARCH_JOBUP_BASE_URL = 'http://www.jobup.ch/search/joblist.asp?cmd=showresults'

  class Search
    # Something for simply running a search:
    def self.run(query_params)
      request = Page::Request.new(SEARCH_JOBUP_BASE_URL)
      request.get_page_content(query_params)
      # Get the pages:
      @pages = request.pages
      main_page = @pages.first
      printf("JobUp::Search: %d posts expected in %d pages\n",main_page.postcount,@pages.length)

      collection = PostCollection.new

      # Loop over each page, get posts:
      @pages.each do |page|
        page.posts.each do |post|
          collection << post
        end
      end
      puts collection
    end
  end
end
