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
    def initialize(pid, datestring, description, enterprise)
      @pid = pid
      @datestring = datestring
      @description = description
      @enterprise = enterprise
    end

    attr_accessor :url, :location

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
