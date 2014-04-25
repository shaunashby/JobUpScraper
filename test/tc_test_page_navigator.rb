#!/usr/bin/env ruby
#____________________________________________________________________
# File: tc_test_page_navigator.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-25 19:20:25+0200
# Revision: $Id$
# Description: Test for page navigation.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'minitest/autorun'
require 'nokogiri'
require 'open-uri'

require 'jobup/page/navigator'

class TestJobUpPageNavigator < MiniTest::Unit::TestCase

  NAV_TEST_FILE=File.expand_path(File.dirname(__FILE__) + '/testpage.html')

  def setup
    @doc = Nokogiri::HTML(open(NAV_TEST_FILE))
    @page_nav = JobUp::Page::Navigator.new(@doc)
  end

  def teardown
    # No action
  end

  def test_page_navigator_class
    assert_equal("#{@page_nav.class}","JobUp::Page::Navigator")
  end

  def test_page_navigator_post_count
  end

end
