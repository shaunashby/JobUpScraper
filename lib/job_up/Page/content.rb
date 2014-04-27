#!/usr/bin/env ruby
#____________________________________________________________________
# File: content.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-26 00:31:56+0200
# Revision: $Id$
# Description: Class to handle returned raw page content from a request.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------

module JobUp
  module Page
    class Content

      SEARCH_LABEL_RESULT_COUNT_XPATH = '//*[@id="label_result_count"]'

      def initialize(doc)
        @doc = doc
      end

      def postcount()
        # Number of posts found:
        n_posts_result_text = @doc.xpath(SEARCH_LABEL_RESULT_COUNT_XPATH).text
        # Strip out the first element (which is the only numerical one):
        @postcount = n_posts_result_text.split(/ /)[0]
      end

      def getNav
      end

    end
  end
end