# JobUpScraper

A tool for scraping job sites and massaging results into usable form.


## About

JobUpScraper is a tool to grab lists of jobs from [JobUp](jobup.ch) and put them into a form that
is useful. The main motivation for this is the limited info provided by the user-configurable JobMailers
which insist on only listing a maximum of 10 new positions in each email notification: not much help when
there might be 60 or more posts to skim over.

This is my attempt at over-engineering something which is intrinsically very easy - for fun!

## How to use it

'''
Usage: job_scraper [options]
====================================================================

Specific options:
    -c, --config <filename.yml>      Load configuration file containing search settings.
    -j <search id>                   Run the search with ID <search id> (default is to run all searches).
    -s, --show                       Show the configured searches and exit.
    -p <pid>                         Start the search from a previous PID.
    -v, --version                    Show version and exit.
    -d, --debug                      Run in debug mode.

Common options:
    -h, --help                       Show this message.
'''

## License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.
If not, see [<http://www.gnu.org/licenses/>](http://www.gnu.org/licenses/).
