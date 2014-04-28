#!/usr/bin/env ruby
#____________________________________________________________________
# File: page_error.rb
#____________________________________________________________________
#
# Author: Shaun Ashby <shaun@ashby.ch>
# Created: 2014-04-26 00:15:57+0200
# Revision: $Id$
# Description: Generic page-handling error class.
#
# Copyright (C) 2014 Shaun Ashby
#
#
#--------------------------------------------------------------------

module JobUp
  class PageError < Exception; end
  class NavError < Exception; end
end
