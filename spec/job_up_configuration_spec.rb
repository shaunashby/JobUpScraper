#!/usr/bin/env ruby
#____________________________________________________________________
# File: job_up_configuration.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-06-24 09:18:43+0200
# Revision: $Id$
# Description: Spec file to test JobSearch::Configuration.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require File.expand_path '../spec_helper.rb', __FILE__

require 'job_up'

describe JobUp::Configuration do

  before(:all) {
    @configuration = JobUp::Configuration.new({ 'config' => "test/files/test.yml" })
  }

  it "should instantiate with a filename as arg" do
    expect(@configuration).to be_an_instance_of(JobUp::Configuration)
  end

  it "should return a list of configured job searches" do
    expect(@configuration.jobsearches.length).to be > 0
  end

  it "should return the base_url from the config" do
    expect(@configuration.base_url).to eq("http://www.jobup.ch/search/joblist.asp?cmd=showresults")
  end

end
