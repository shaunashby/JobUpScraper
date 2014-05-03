#!/usr/bin/env ruby
#____________________________________________________________________
# File: job_up.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-24 11:18:12+0200
# Revision: $Id$
# Description: JobUp module entrypoint.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------

module JobUp
  VERSION='0.0.1'

  module JobMailer

    SUBCATEGORIES = [ 147, 199, 13, 194, 197, 42, 71, 195, 1, 72, 198, 193, 88, 196 ]
    CANTONS = [ "GE1", "GE2", "GE3", "VD1", "GE" ]
    KEYWORDS = [ "UNIX", "Linux", "Unix", "linux", "system+admin", "monitoring", "puppet", "nagios"]
    EMPLOYMENT = [ "PERMANENT", "LIMITED", "FREELANCE" ]

    COMPANYTYPES_ALL = 0
    COMPANYTYPES_ENTERPRISE_ONLY = 1
    COMPANYTYPES_AGENCIES_ONLY = 2
    COMPANYTYPES = [  COMPANYTYPES_ALL, COMPANYTYPES_AGENCIES_ONLY, COMPANYTYPES_ENTERPRISE_ONLY ]

    class Criteria
      require 'cgi'

      def initialize()
        @subcategories = SUBCATEGORIES.join(",")
        @cantons = CANTONS.join(",")
        @keywords = KEYWORDS.map { |k| CGI.escape(k) }.join("/")
        @employment = EMPLOYMENT.join(",")

        @query_params = sprintf("&subcategories=%s&cantons=%s&keywords=%s&employment=%s&companytypes=%s",
                                @subcategories,
                                @cantons,
                                @keywords,
                                @employment,
                                COMPANYTYPES_ALL)
      end

      attr_reader :query_params
      attr_reader :keywords

    end
  end

  class ConfigError < StandardError; end

  class Configuration

    class Params; end

    require 'yaml'

    CONFIG_FILE='jobsearch.yml'

    def initialize(opts={})
      @options = opts
      # Parse the supplied config file or use the default
      # if one given on command-line:
      @options['config'] ? parse(@options['config']) : parse()

    end

    def parse(filename=CONFIG_FILE)
      conf = nil
      begin
        File.open(filename, "rb") do |f|
          conf = YAML::load(f)
        end

        puts conf.inspect

        conf['jobsearch'].each do |jm|
          printf("Found configured search: ID %d\n",jm['jmid'])
          printf("--> %s\n",jm['desc'])
          print("**************************************\n")
          printf("",)
        end
      rescue => err
        $stderr.print("ERROR: #{err}.\n")
      end

    end

  end

end
