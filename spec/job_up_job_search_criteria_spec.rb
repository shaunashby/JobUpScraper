#!/usr/bin/env ruby
#____________________________________________________________________
# File: job_up_job_search_criteria_spec.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-06-24 15:10:31+0200
# Revision: $Id$
# Description: Spec for JobUp::JobSearch::Criteria class.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require File.expand_path '../spec_helper.rb', __FILE__

require 'job_up'

describe JobUp::JobSearch::Criteria do

  before(:all) { 
    @criteria = JobUp::JobSearch::Criteria.new(354346,
                                               "System Admin UNIX/Linux",
                                               :subcategories => [ 147,199,13,194,197,42,71,195,1,72,198,193,88,196 ],
                                               :cantons       => [ "GE1", "GE2", "GE3", "VD1", "GE" ],
                                               :keywords      => [ "UNIX","Linux","Unix","linux","system+admin","monitoring","puppet","nagios" ],
                                               :employment    => [ "PERMANENT","LIMITED","FREELANCE" ],
                                               :companytypes  => 0)
  }

  it "should instantiate with all args" do
    expect(@criteria).to be_an_instance_of(JobUp::JobSearch::Criteria)
  end

  it "should return the correct query params string" do
    wanted="&subcategories=147,199,13,194,197,42,71,195,1,72,198,193,88,196&cantons=GE1,GE2,GE3,VD1,GE&keywords=UNIX/Linux/Unix/linux/system%2Badmin/monitoring/puppet/nagios&employment=PERMANENT,LIMITED,FREELANCE&companytypes=0"
    expect(@criteria.query_params).to eq(wanted)
  end

end
