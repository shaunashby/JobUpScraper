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

module JobUp

  class Post
    POST_PRINT_FORMAT="%-15s %-8d %-60s %-40s %-20s\n"

    def initialize(pid, datestring, description, enterprise)
      @pid = pid
      @datestring = datestring
      @description = description
      @enterprise = enterprise
    end

    attr_accessor :url, :location

    def <=>(p)
      return @pid <=> p.pid
    end

    def to_s
      return sprintf(POST_PRINT_FORMAT,
                     @datestring,
                     @pid,
                     @description,
                     @enterprise,
                     @location)
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
