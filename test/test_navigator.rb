#!/usr/bin/env ruby
#____________________________________________________________________
# File: test_navigator.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-21 00:10:42+0200 (Time-stamp: <2014-04-21 00:51:57 sashby>)
# Revision: $Id$
# Description: Simple test to get the navigation block from a JobUp page result.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'test/unit'
require 'nokogiri'
require 'open-uri'

class NavigationURLBuilder < Test::Unit::TestCase

  def setup
    @jobup_search_base_url='http://www.jobup.ch/search/joblist.asp'
    @jobup_cmd='showresults'
    @jobup_search_subcategories=",147,199,13,194,197,42,71,195,1,72,198,193,88,196,"
    @jobup_search_cantons="GE1,GE2,GE3,VD1,GE"
    @jobup_search_keywords="UNIX/Linux/Unix/linux/system%2Badmin/monitoring/puppet/nagios"
    @jobup_employment_flags="PERMANENT,LIMITED,FREELANCE"
    @jobup_companytypes="0"
  end

  def teardown
    # no action needed
  end

  def test_navigation_url_builder
    chkURL='http://www.jobup.ch/search/joblist.asp?cmd=showresults&subcategories=,147,199,13,194,197,42,71,195,1,72,198,193,88,196,&cantons=GE1,GE2,GE3,VD1,GE&keywords=UNIX/Linux/Unix/linux/system%2Badmin/monitoring/puppet/nagios&employment=PERMANENT,LIMITED,FREELANCE&companytypes=0'

    # FIXME: Use a formatted print to replace this monstrosity...
    searchURL=@jobup_search_base_url+'?cmd='+@jobup_cmd+'&subcategories='+@jobup_search_subcategories+
      '&cantons='+@jobup_search_cantons+
      '&keywords='+@jobup_search_keywords+
      '&employment='+@jobup_employment_flags+
      '&companytypes='+@jobup_companytypes

    assert_equal(chkURL,searchURL)

  end
end
