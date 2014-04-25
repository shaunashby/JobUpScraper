#!/usr/bin/env ruby
#____________________________________________________________________
# File: navigator.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-24 11:20:23+0200
# Revision: $Id$
# Description: Class to handle extracting navigation block from a results page.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------

module JobUp
  module Page

    class Navigator

      def initialize(doc)
        @pagecount=nil
        @job_uri=Array.new

        begin
          if doc.instance_of?(Nokogiri::HTML::Document)

          else
            raise "Got some other type of document: #{doc.class}"
          end
        rescue => err
          $stderr.write("ERROR: No Nokogiri document received.")
        end
      end

      attr_reader :pagecount

    end
  end
end
