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
    JobUp::Search.run(search_base_url, job_search.query_params)

  }

  it "should return results from a search" do
    pending("not yet implemented")
    fail
  end

end
