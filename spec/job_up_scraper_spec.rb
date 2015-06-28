#!/usr/bin/env ruby
#____________________________________________________________________
# File: job_up_scraper_spec.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-06-23 14:56:53+0200
# Revision: $Id$
# Description: The main spec for the JobUpScraper application.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require File.expand_path '../spec_helper.rb', __FILE__

require 'job_up'
require 'job_up/search'

describe "JobUp scraper application" do

  before(:all) {
    configuration = JobUp::Configuration.new()
    # Base url for searches:
    search_base_url = configuration.base_url()
    job_search = configuration.jobsearches.first
    @search = JobUp::Search.new(search_base_url, job_search.query_params)
    @search.run
    @collection = @search.collection
  }

  it "should return results from a search" do
    expect(@collection.length).to be > 0
  end

  it "should return results as JSON" do
    expect(@search.getJSON).to match(/json_class/)
  end

  it "should return results from a search ordered by Post ID" do
    latest_pid = @collection.first.pid
    oldest_pid = @collection.last.pid
    expect(latest_pid).to be > oldest_pid
  end

end
