#!/usr/bin/env ruby
#____________________________________________________________________
# File: tc_test_page_request.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-27 22:44:23+0200
# Revision: $Id$
# Description: Unit tests for Page::Request
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'minitest/autorun'

require 'job_up/page/request'

class TestJobUpPageRequest < MiniTest::Unit::TestCase

  TEST_FILE_FOR_URL=File.expand_path(File.dirname(__FILE__) + '/testpage.html')
  TEST_URL = 'http://www.jobup.ch/search/joblist.asp?cmd=showresults&subcategories=,147,199,13,194,197,42,71,195,1,72,198,193,88,196,&cantons=GE1,GE2,GE3,VD1,GE&keywords=UNIX/Linux/Unix/linux/system%2Badmin/monitoring/puppet/nagios&employment=PERMANENT,LIMITED,FREELANCE&companytypes=0'

  def setup
    @base_url = TEST_FILE_FOR_URL
    @query_params = "" # Empty query
    @req = JobUp::Page::Request.new(@base_url)
  end

  def teardown
    # No action
  end

  def test_page_request_initialize
    assert_equal("#{@req.class}","JobUp::Page::Request")
  end

  def test_page_request_get_page_content
    page = @req.getPageContent(@query_params)
    assert_equal("#{page.class}","JobUp::Page::Content")
  end

end
