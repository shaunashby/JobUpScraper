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
require 'job_up/version'

module JobUp
  module JobSearch
    #
    #    COMPANYTYPES_ALL = 0
    #    COMPANYTYPES_ENTERPRISE_ONLY = 1
    #    COMPANYTYPES_AGENCIES_ONLY = 2
    #
    class Criteria
      require 'cgi'

      def initialize(id, description, params)
        @id = id
        @description = description

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

      attr_reader :id
      attr_reader :description
      attr_reader :query_params

      def show
        info = self.to_s
        info += sprintf("Query: %s\n",@query_params)
        info += sprintf("*************************************************************************************\n")
        info += sprintf("\n")
        return info
      end

      def to_s
        return sprintf("<#{self.object_id}>: Configured search ID %-8d            --> %s\n",@id, @description)
      end

    end
  end

  class ConfigError < StandardError; end

  class Configuration
    require 'yaml'

    CONFIG_FILE='jobsearch.yml'

    def initialize(opts={})
      @options = opts
      @base_url = nil
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

        @base_url = conf['base_url']

        @jobsearches = Array.new
        conf['jobsearch'].each do |jobsearch|
          @jobsearches << JobSearch::Criteria.new(jobsearch['id'],
                                                  jobsearch['description'],
                                                  :subcategories => jobsearch['subcategories'],
                                                  :cantons       => jobsearch['cantons'],
                                                  :keywords      => jobsearch['keywords'],
                                                  :employment    => jobsearch['employment'],
                                                  :companytypes  => jobsearch['companytypes'])
        end
      rescue => err
        $stderr.print("ERROR: #{err}.\n")
      end
    end

    attr_reader :jobsearches
    attr_reader :base_url

  end

end
