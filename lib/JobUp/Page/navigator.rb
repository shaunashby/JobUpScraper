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
        begin
          if doc.class === 'Nokogiri::HTML::Document'
            
          end
        rescue => err
          $stderr.print("ERROR: No Nokogiri document received.")
        end
      end

    end
  end
end
