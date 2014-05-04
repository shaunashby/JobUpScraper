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

      def initialize(jmid, desc, params)
        @jmid = jmid
        @desc = desc

        @query_params  = sprintf("&subcategories=%s",params[:subcategories].join(","))
        @query_params += sprintf("&cantons=%s",params[:cantons].join(","))

        if !params[:keywords].nil?
          keywords    = params[:keywords].map { |k| CGI.escape(k) }.join("/")
          @query_params += sprintf("&keywords=%s",keywords)
        end

        @query_params += sprintf("&employment=%s",params[:employment].join(","))

        if !params[:companytypes].nil?
          @query_params += sprintf("&companytypes=%s",params[:companytypes])
        end
      end

      attr_reader :jmid
      attr_reader :desc
      attr_reader :query_params

      def show
        info = self.to_s
        info += sprintf("Query: %s\n",@query_params)
        info += sprintf("*************************************************************************************\n")
        info += sprintf("\n")
        return info
      end

      def to_s
        return sprintf("<#{self.object_id}>: Configured search ID %-8d            --> %s\n",@jmid, @desc)
      end

    end
  end

  class ConfigError < StandardError; end

  class Configuration
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
        @jobmailers = Hash.new

        conf['jobsearch'].each do |jm|
          @jobmailers[jm['jmid']] = JobMailer::Criteria.new(jm['jmid'],
                                                            jm['desc'],
                                                            :subcategories => jm['subcategories'],
                                                            :cantons       => jm['cantons'],
                                                            :keywords      => jm['keywords'],
                                                            :employment    => jm['employment'],
                                                            :companytypes  => jm['companytypes'])
        end
      rescue => err
        $stderr.print("ERROR: #{err}.\n")
      end

    end

  end

end
