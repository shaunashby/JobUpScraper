#!/usr/bin/env ruby
#____________________________________________________________________
# File: tc_test_search.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-05-01 22:46:11+0200
# Revision: $Id$
# Description: Test the JobUp::Search functionality.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'job_up/search'

class TestSearch < MiniTest::Unit::TestCase

  def test_search_post_class
    post = JobUp::Post.new(996104,"1 Mai 2014","IT-Support","ABC & Cie S.A.")
    assert_instance_of(JobUp::Post, post, "Check instantiation of JobUp::Post")
  end

  def test_search_postcollection_class
    post_collection = JobUp::PostCollection.new
    assert_instance_of(JobUp::PostCollection,
                       post_collection,
                       "Check instantiation of JobUp::PostCollection")
  end

  def test_search_postcollection_add_post
    post_collection = JobUp::PostCollection.new
    post = JobUp::Post.new(996104,"1 Mai 2014","IT-Support","ABC & Cie S.A.")
    post_collection << post
    assert(post_collection.members.length == 1)
  end

  def test_search_run_method
    pass
  end

end
