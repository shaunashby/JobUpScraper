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

  def setup
    @base_url = TEST_FILE_FOR_URL
    @query_params = "" # Empty query
  end

  def teardown
    # No action
  end

  def test_page_request_initialize
    req = JobUp::Page::Request.new(@base_url)
    assert_equal("#{req.class}","JobUp::Page::Request")
  end

end
