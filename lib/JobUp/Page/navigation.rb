#!/usr/bin/env ruby
#____________________________________________________________________
# File: navigation.rb
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

    class PageError

    end

    class Navigation

      def initialize(doc)
        begin
          if doc.class === 'Nokogiri::HTML::Document'
            
          end
        rescue

        end
      end

    end
  end
end
