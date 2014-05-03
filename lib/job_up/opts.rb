#!/usr/bin/env ruby
#____________________________________________________________________
# File: opts.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-05-03 18:50:18+0200
# Revision: $Id$
# Description: Class to handle parsing of options.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------
module JobUp
  class Opts
    require 'optparse'

    def self.parse(args)
      # Set some defaults:
      options = {
        'debug' => false
      }

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: job_scraper [options] \n====================================================================\n"
        opts.separator ""
        opts.separator "Specific options:"

        opts.on("-c", "--config <filename.yml>", "Load configuration file containing search settings.") do |c|
          options['config'] = c
        end

        opts.on("-j", "-j <jid>", "Run the search with ID <jid> (default is to run all searches).") do |j|
          options['jid'] = j
        end

        opts.on("-p", "-p <pid>", "Start the search from a previous PID.") do |p|
          options['start_pid'] = p
        end

        opts.on("-v", "--version", "Show version and exit.") do |v|
          options['Version'] = true
        end

        opts.on("-d", "--debug", "Run in debug mode.") do |v|
          options['debug'] = true
        end

        opts.separator ""
        opts.separator "Common options:"

        opts.on_tail("-h", "--help", "Show this message.") do
          puts opts
          exit
        end
      end

      begin
        opts.parse!(args)
      rescue OptionParser::InvalidOption
        puts "Invalid option - for usage, use -h"
        exit
      end

      options
    end
  end
end
