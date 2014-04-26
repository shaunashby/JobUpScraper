#!/usr/bin/env ruby
#____________________________________________________________________
# File: tc_test_main.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-23 22:19:40+0200
# Revision: $Id$
# Description: A test script to run a main-like function
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'minitest/autorun'

require 'job_up'

class JobUpMain
  def initialize
    @search_url='http://www.jobup.ch/search/joblist.asp?cmd=showresults&subcategories=,147,199,13,194,197,42,71,195,1,72,198,193,88,196,&cantons=GE1,GE2,GE3,VD1,GE&keywords=UNIX/Linux/Unix/linux/system%2Badmin/monitoring/puppet/nagios&employment=PERMANENT,LIMITED,FREELANCE&companytypes=0'

  end
end

class TestJobUpMain < MiniTest::Unit::TestCase
  def setup
    @ju = JobUpMain.new
    @jm = JobUp::JobMailer::Criteria.new
  end

  def teardown
    # No action
  end

  def test_main_class
    assert_equal("#{@ju.class}","JobUpMain")
  end

  def test_jobmailer_criteria_query_uri
    jmqu = @jm.query_params
    assert_equal("#{jmqu}","&subcategories=147,199,13,194,197,42,71,195,1,72,198,193,88,196&cantons=GE1,GE2,GE3,VD1,GE&keywords=UNIX%2FLinux%2FUnix%2Flinux%2Fsystem%2Badmin%2Fmonitoring%2Fpuppet%2Fnagios&employment=PERMANENT,LIMITED,FREELANCE&companytypes=0")
  end

end
