#!/usr/bin/env ruby
#____________________________________________________________________
# File: scraper.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-05 14:11:46+0200 (Time-stamp: <2014-04-20 23:36:49 sashby>)
# Revision: $Id$
# Description: A program to scrape job sites for interesting offers.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'nokogiri'
require 'open-uri'


class JobUp
  class JobMailer
  end
  class ResultPage
  end
end

class JobSearch
  class JobCollection
    def init
      @jobs=Array::new
    end
  end
  def self.run()
    puts 'Running search...'
  end
end
