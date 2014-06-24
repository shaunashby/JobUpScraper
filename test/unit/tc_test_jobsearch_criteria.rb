#!/usr/bin/env ruby
#____________________________________________________________________
# File: tc_test_jobsearch_criteria.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-05-04 20:37:02+0200
# Revision: $Id$
# Description: Test JobSearch::Criteria.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'minitest/autorun'

require 'job_up'

class TestJobUpSearchCriteria < MiniTest::Unit::TestCase

  def setup
    @criteria = JobUp::JobSearch::Criteria.new(354346,
                                               "System Admin UNIX/Linux",
                                               :subcategories => [ 147,199,13,194,197,42,71,195,1,72,198,193,88,196 ],
                                               :cantons       => [ "GE1", "GE2", "GE3", "VD1", "GE" ],
                                               :keywords      => [ "UNIX","Linux","Unix","linux","system+admin","monitoring","puppet","nagios" ],
                                               :employment    => [ "PERMANENT","LIMITED","FREELANCE" ],
                                               :companytypes  => 0)
  end

  def test_build_query_params
    assert_equal(@criteria.query_params,
                 "&subcategories=147,199,13,194,197,42,71,195,1,72,198,193,88,196&cantons=GE1,GE2,GE3,VD1,GE&keywords=UNIX/Linux/Unix/linux/system%2Badmin/monitoring/puppet/nagios&employment=PERMANENT,LIMITED,FREELANCE&companytypes=0")
  end

end
