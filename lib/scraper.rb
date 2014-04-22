#!/usr/bin/env ruby
#____________________________________________________________________
# File: Scraper.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-09 23:47:33+0200 (Time-stamp: <2014-04-11 23:56:57 sashby>)
# Revision: $Id$
# Description: Module to collect together scraper classes.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------

module Scraper

  class JobUp
    def initialize(url)
      @url = url
    end

    attr_accessor :url

  end
  
end
