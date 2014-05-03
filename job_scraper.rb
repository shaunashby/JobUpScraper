#!/usr/bin/env ruby
#____________________________________________________________________
# File: job_scraper.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-05-03 16:23:54+0200
# Revision: $Id$
# Description: Main script to run a JobUp scraper job.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
require 'job_up/opts'

# Get the options from the command-line:
options = JobUp::Opts.parse(ARGV)

# Set up the search and run it:
require 'job_up'
require 'job_up/search'

# If a search id is given as an option, run a single search:
if options['jid']
  puts "Searching using JobMailer opts #{options['jid']}:"
else

end

configuration = JobUp::Configuration.new(options)



#jobmailer = JobUp::JobMailer::Criteria.new
#query_params = jobmailer.query_params()
#JobUp::Search.run(query_params)
