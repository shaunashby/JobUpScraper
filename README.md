JobUpScraper
============

A tool to grab lists of jobs from JobUp.ch and put them into a form that is useful. The main
motivation for this is the limited info provided by the JobMailers which insist on only listing
a maximum of 10 new positions in each email notification: not much help when there might be 60
or more posts.

This is my attempt at over-engineering something which is intrinsically very easy - for fun!

How to use it
-------------

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
