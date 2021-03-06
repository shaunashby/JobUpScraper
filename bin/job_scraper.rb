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
$:.unshift File.expand_path("../../lib", __FILE__)

require 'job_up/opts'

# Get the options from the command-line:
options = JobUp::Opts.parse(ARGV)

# Set up the search and run it:
require 'job_up'
require 'job_up/search'

# Get the configuration:
configuration = JobUp::Configuration.new(options)

verbose = false

# Base url for searches:
search_base_url = configuration.base_url()

# Handle version option:
if options['version']
  puts JobUp::VERSION
  exit 0
end

# Handle show option:
if options['show']
  configuration.jobsearches.each do |job_search|
      puts job_search.show
  end
  exit 0
end

# Handle verbose option:
if options['verbose']
  verbose = true
end

# Check for the persistence flag. If this is set, data will be cached locally
# and can be replayed:
if options['persist']
  puts "This session will be cached.\n";
  ENV['JUS_USE_CACHE'] = "true"
end

# If a search id is given as an option, run a single search:
if options['search_id']
  search_id = options['search_id'].to_i
  puts "Searching with search ID #{search_id}:"
  job_search = configuration.jobsearches.select { |jobsearch| jobsearch.id == search_id }
  if job_search.empty?
    $stderr.print("ERROR: Unable to find search with id #{search_id}\n")
    exit 1
  else
    searcher = JobUp::Search.new(search_base_url, job_search.first.query_params)
    searcher.run(verbose)
    puts "#{searcher}"
  end
else
  puts "Running all searches....\n"
  puts "\n"
  configuration.jobsearches.each do |job_search|
    if options['debug']
      puts job_search
    end
    searcher = JobUp::Search.new(search_base_url, job_search.query_params)
    searcher.run(verbose)
    puts "#{searcher}"
  end
end
