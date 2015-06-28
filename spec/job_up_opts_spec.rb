#!/usr/bin/env ruby
#____________________________________________________________________
# File: job_up_opts_spec.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-06-24 08:56:54+0200
# Revision: $Id$
# Description: Spec file for JobUp::Opts.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require File.expand_path '../spec_helper.rb', __FILE__

require 'job_up/opts'

describe JobUp::Opts, '#parse' do

  it "should parse config file name option" do
    @argv=["-c","test/files/test.yml"]
    options = JobUp::Opts.parse(@argv)
    expect(options["config"]).to eq("test/files/test.yml")
  end

  it "should parse debug option" do
    @argv=["-d"]
    options = JobUp::Opts.parse(@argv)
    expect(options["debug"]).to be(true)
  end

  it "should parse version option" do
    @argv=["-V"]
    options = JobUp::Opts.parse(@argv)
    expect(options["version"]).to be(true)
  end

  it "should parse verbose option" do
    @argv=["-v"]
    options = JobUp::Opts.parse(@argv)
    expect(options["verbose"]).to be(true)
  end

  it "should parse show option" do
    @argv=["-s"]
    options = JobUp::Opts.parse(@argv)
    expect(options["show"]).to be(true)
  end

  it "should pass specific search options" do
    @argv=["-j","12345"]
    options = JobUp::Opts.parse(@argv)
    expect(options["search_id"]).to eq("12345")
  end

  it "should pass search resume options" do
    @argv=["-p","12345"]
    options = JobUp::Opts.parse(@argv)
    expect(options["start_pid"]).to eq("12345")
  end

end
