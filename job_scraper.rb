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

# Read the configuration file:
require 'yaml'

yamlconf = nil
File.open(options['config'], "rb") do |f|
  yamlconf = YAML::load(f)
  options['base_url'] = yamlconf['jobup_base_url']
end

# Set up the search and run it:
require 'job_up'
require 'job_up/search'

# If a search id is given as an option, run a single search:
if options['jid']
  puts "Searching using JobMailer opts #{options['jid']}:"
else

end

puts yamlconf['jobsearch'].inspect


#jobmailer = JobUp::JobMailer::Criteria.new
#query_params = jobmailer.query_params()
#JobUp::Search.run(query_params)



# jmid:
#   desc:
#   keywords:
#   subcategories:
#   cantons:
#   employment:
#   companytypes:

# jmid: 2
#   - desc: This is the description
#   - keywords: UNIX,Linux,linux,system+admin
#   - subcategories: 1,2,3,4,5
#   - cantons: GE1,GE2,GE3,VD1
#   - employment: PERMANENT,LIMITED,FREELANCE
#   - companytypes: 2
