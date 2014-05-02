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

require 'job_up/page/navigator'
require 'job_up/post'

module JobUp
  module Page
    class Content

      SEARCH_LABEL_RESULT_COUNT_XPATH = '//*[@id="label_result_count"]'
      SEARCH_OL_JOBS_LIST_LINKS_XPATH = '//*[@id="jobs_list"]/li/div'

      def initialize(doc)
        @doc = doc
        @posts = Array.new
      end

      def postcount()
        # Number of posts found:
        n_posts_result_text = @doc.xpath(SEARCH_LABEL_RESULT_COUNT_XPATH).text
        # Strip out the first element (which is the only numerical one) and
        # make sure that it's returned as an integer:
        return n_posts_result_text.split(/ /)[0].to_i
      end

      def posts
        @doc.xpath(SEARCH_OL_JOBS_LIST_LINKS_XPATH).each do |p|

          post = Post.new(p.at_xpath('div/label[@class="C_PID"]').text.to_i,
                          p.at_xpath('div/span[@class="C_PDATE"]').text,
                          p.at_xpath('a').text,
                          p.at_xpath('label[@class="C_PNAME"]').text)
          post.url      = p.at_xpath('a').attr('href')
          post.location = p.at_xpath('label[@class="C_PCANTONS"]').text

          @posts << post
        end
        return @posts
      end

      def to_s
        return sprintf("<id=%s  doc=%s>",self.object_id,@doc.object_id)
      end

    end
  end
end
