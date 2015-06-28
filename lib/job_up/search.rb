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

  class Search
    def initialize(url, query_params)
      @pages = nil
      @base_url = url
      @query_params = query_params
      @collection = nil
    end

    # Something for simply running a search:
    def run()
      request = Page::Request.new(@base_url)
      request.get_page_content(@query_params)
      # Get the pages:
      @pages = request.pages
      main_page = @pages.first
      printf("JobUp::Search: %d posts expected in %d pages\n",main_page.postcount,@pages.length)

      @collection = PostCollection.new

      if !ENV['JUS_USE_CACHE'].nil? && !ENV['JUS_USE_CACHE'].empty?
        puts "Going to be persistent...\n"
      end

      # Loop over each page, get posts:
      @pages.each do |page|
        page.posts.each do |post|
          @collection << post
        end
      end
    end

    attr_reader :collection

    def to_s
      s = sprintf("%s",@collection)
      @collection.members.sort.reverse.each do |p|
        s += "#{p}"
      end
      return s
    end

    def getJSON()
      require 'json' unless defined?(JSON::JSON_LOADED)

      request = Page::Request.new(@base_url)
      request.get_page_content(@query_params)
      @collection = PostCollection.new

      # Get the pages:
      request.pages.each do |page|
        page.posts.each do |post|
          @collection << post
        end
      end

      return JSON.generate(collection.members.sort.reverse)
    end
  end
end
