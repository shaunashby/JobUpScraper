#!/usr/bin/env ruby
#____________________________________________________________________
# File: page.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-26 00:31:56+0200 (Time-stamp: <2014-04-26 00:52:10 sashby>)
# Revision: $Id$
# Description: Class to handle returned raw pages from a request.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
module JobUp
  class Page
    def initialize(rawdoc)
      @rawdoc = rawdoc
    end

  end
end
