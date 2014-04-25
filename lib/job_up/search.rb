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

require 'job_up/page/navigator'

module JobUp

  SEARCH_DIV_SEARCH_CONTENT_MAIN_TABLE_XPATH      ='//*[@id="search_content"]/div/table'
  SEARCH_DIV_SEARCH_CONTENT_MAIN_TABLE_BODY_XPATH ='//*[@id="search_content"]/div/table/tbody'

  SEARCH_LABEL_RESULT_COUNT_XPATH = '//*[@id="label_result_count"]'
  SEARCH_NAV_BLOCK_NAV_LAST       = '//*[@id="nav_last"]'
  SEARCH_OL_JOBS_LIST_XPATH       = '//*[@id="jobs_list"]/li/div'

  class Search
    # Something for simply running a search:
    def self.run(url)
    end

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
    end
  end

end
