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

require 'job_up/page/navigator'

class TestJobUpPageNavigator < MiniTest::Unit::TestCase

  NAV_TEST_FILE=File.expand_path(File.dirname(__FILE__) + '/../files/testpage.html')
  NAV_TEST_FILE_NO_NAV_LAST=File.expand_path(File.dirname(__FILE__) + '/../files/testpage-no-nav-last.html')
  NAV_TEST_FILE_SINGLE_PAGE_RESULT=File.expand_path(File.dirname(__FILE__) + '/../files/testpage-single-page-1-post.html')

  def setup
    @doc = Nokogiri::HTML(open(NAV_TEST_FILE))
    @doc_no_nav_last = Nokogiri::HTML(open(NAV_TEST_FILE_NO_NAV_LAST))
    @doc_single_post = Nokogiri::HTML(open(NAV_TEST_FILE_SINGLE_PAGE_RESULT))
    @page_nav = JobUp::Page::Navigator.new(@doc)
    @page_nav_no_nav_last = JobUp::Page::Navigator.new(@doc_no_nav_last)
    @page_single_post = JobUp::Page::Navigator.new(@doc_single_post)
  end

  def teardown
    # No action
  end

  def test_page_navigator_class
    assert_equal("#{@page_nav.class}","JobUp::Page::Navigator")
  end

  def test_page_navigator_page_count
    assert_equal(@page_nav.pagecount, 10)
  end

  def test_page_navigator_no_nav_last
    assert_equal(@page_nav_no_nav_last.pagecount, 4)
  end

  def test_page_navigator_single_page_result
    assert_equal(@page_single_post.pagecount, 1)
  end

end
