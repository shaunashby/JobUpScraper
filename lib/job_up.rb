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
    #
    #    COMPANYTYPES_ALL = 0
    #    COMPANYTYPES_ENTERPRISE_ONLY = 1
    #    COMPANYTYPES_AGENCIES_ONLY = 2
    #
    class Criteria
      require 'cgi'

      def initialize(id, desc, params)
        @id = id
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

      attr_reader :id
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
        return sprintf("<#{self.object_id}>: Configured search ID %-8d            --> %s\n",@id, @desc)
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
          @jobmailers[jm['id']] = JobMailer::Criteria.new(jm['id'],
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

    attr_reader :jobmailers
  end

end
