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

# Get the configuration:
configuration = JobUp::Configuration.new(options)

# Base url for searches:
search_base_url = configuration.base_url()

# Handle version option:
if options['version']
  puts JobUp::VERSION
  exit 0
end

# Handle show option:
if options['show']
  configuration.jobsearches.each do |search|
      puts search.show
  end
  exit 0
end

# If a search id is given as an option, run a single search:
if options['search_id']
  search_id = options['search_id'].to_i
  puts "Searching with search ID #{search_id}:"
  search = configuration.jobsearches.select { |jobsearch| jobsearch.id == search_id }
  if search.empty?
    $stderr.print("ERROR: Unable to find search with id #{search_id}\n")
    exit 1
  end
else
  puts "Running all searches....\n"
  puts "\n"
  configuration.jobsearches.each do |search|
    if options['debug']
      puts search
    end
    JobUp::Search.run(search_base_url, c.query_params)
  end
end
