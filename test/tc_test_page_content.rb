#!/usr/bin/env ruby
#____________________________________________________________________
# File: tc_test_page_content.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-28 00:16:24+0200
# Revision: $Id$
# Description: Unit test for Page::Content.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'minitest/autorun'
require 'nokogiri'
require 'open-uri'

require 'job_up/page/content'

class TestJobUpPageContent < MiniTest::Unit::TestCase

  TEST_FILE_FOR_URL=File.expand_path(File.dirname(__FILE__) + '/testpage.html')

  def setup
    @doc = Nokogiri::HTML(open(TEST_FILE_FOR_URL))
    @page_content = JobUp::Page::Content.new(@doc)
  end

  def teardown
    # No action
  end

  def test_page_content_initialize
    assert_equal("#{@page_content.class}","JobUp::Page::Content")
  end

  def test_page_content_get_nav
    nav = @page_content.getNav
    assert_equal("#{nav.class}","JobUp::Page::Navigator")
  end

  def test_page_content_get_post_count
    assert_equal(@page_content.postcount, 91)
  end
end
