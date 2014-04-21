#!/usr/bin/env ruby
#____________________________________________________________________
# File: tc_test_url.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-21 15:37:39+0200 (Time-stamp: <2014-04-21 16:07:14 sashby>)
# Revision: $Id$
# Description: Simple test that URL is built correctly.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'minitest/unit'

class JobUp
  class URL

    def initialize
      @jobup_search_base_url='http://www.jobup.ch/search/joblist.asp'
      @jobup_cmd='showresults'
      @jobup_search_subcategories=",147,199,13,194,197,42,71,195,1,72,198,193,88,196,"
      @jobup_search_cantons="GE1,GE2,GE3,VD1,GE"
      @jobup_search_keywords="UNIX/Linux/Unix/linux/system%2Badmin/monitoring/puppet/nagios"
      @jobup_employment_flags="PERMANENT,LIMITED,FREELANCE"
      @jobup_companytypes="0"
    end

    private

    def build_url
      # FIXME: Use a formatted print to replace this monstrosity...
      return @jobup_search_base_url+'?cmd='+@jobup_cmd+'&subcategories='+@jobup_search_subcategories+
        '&cantons='+@jobup_search_cantons+
        '&keywords='+@jobup_search_keywords+
        '&employment='+@jobup_employment_flags+
        '&companytypes='+@jobup_companytypes
    end

  end
end

class TestURL < Minitest::Test

  def setup
    @url = JobUp::URL.new
  end

  def teardown
    # No action
  end

  def test_url
    testURL='http://www.jobup.ch/search/joblist.asp?cmd=showresults&subcategories=,147,199,13,194,197,42,71,195,1,72,198,193,88,196,&cantons=GE1,GE2,GE3,VD1,GE&keywords=UNIX/Linux/Unix/linux/system%2Badmin/monitoring/puppet/nagios&employment=PERMANENT,LIMITED,FREELANCE&companytypes=0'
    searchURL=@url.build_url
    assert_equal(testURL,searchURL)
  end
end
