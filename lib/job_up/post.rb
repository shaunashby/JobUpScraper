#!/usr/bin/env ruby
#____________________________________________________________________
# File: post.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-05-02 14:32:31+0200
# Revision: $Id$
# Description: Class to handle posted job ads.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'date'

module JobUp

  class Post
    POST_PRINT_FORMAT="%-15s %-8d %-60s %-40s %-20s\n"
    POST_DATE_FORMAT='%d/%m/%y'

    def initialize(pid, datestring, description, enterprise, url, location)
      @pid = pid
      @date = DateTime.parse(datestring)
      @description = description
      @url = url

      # Clean up funny symbols which are difficult to remove with regexp (via gsub)
      # For some reason or other (encoding issues). Discard first 2 elements:
      @enterprise = enterprise.slice!(2,enterprise.length-1)
      @location = location.slice!(2,location.length-1)
    end

    attr_accessor :pid, :url, :location

    def <=>(p)
      return @pid <=> p.pid
    end

    def to_s
      return sprintf(POST_PRINT_FORMAT,
                     @date.strftime(POST_DATE_FORMAT),
                     @pid,
                     @description,
                     @enterprise,
                     @location)
    end

    def to_json(*a)
      {
        'json_class'   => self.class.name,
        'data'         => [
          :date        => @date,
          :pid         => @pid,
          :description => @description,
          :enterprise  => @enterprise,
          :location    => @location,
          :url         => @url
        ]
      }.to_json(*a)
    end

  end

  class PostCollection
    def initialize
      @members = []
    end

    def <<(post)
      @members << post
    end

    attr_reader :members

    def to_s
      return sprintf("<%s> Membership: %d\n",self.object_id,@members.length)
    end

  end
end
