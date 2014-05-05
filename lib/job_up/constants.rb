#!/usr/bin/env ruby
#____________________________________________________________________
# File: constants.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-05-05 13:05:15+0200 (Time-stamp: <2014-05-05 13:39:04 sashby>)
# Revision: $Id$
# Description: Constants used in document searches using XPath.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------

module JobUp
    SEARCH_DIV_SEARCH_CONTENT_MAIN_TABLE_XPATH      ='//*[@id="search_content"]/div/table'
    SEARCH_DIV_SEARCH_CONTENT_MAIN_TABLE_BODY_XPATH ='//*[@id="search_content"]/div/table/tbody'

    SEARCH_OL_JOBS_LIST_XPATH       = '//*[@id="jobs_list"]'
    SEARCH_OL_JOBS_LIST_LINKS_XPATH = '//*[@id="jobs_list"]/li/div'

    SEARCH_LABEL_RESULT_COUNT_XPATH = '//*[@id="label_result_count"]'

    SEARCH_NAV_BLOCK                = '//*[@id="navigator"]'
    SEARCH_NAV_BLOCK_NAV_LAST       = '//*[@id="nav_last"]'
    SEARCH_NAV_BLOCK_C_LINK         = 'a[@class="C_LINK"]'
end
