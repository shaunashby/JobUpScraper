# JobUpScraper

A gem for scraping a job site and massaging results into usable form.

## About

JobUpScraper is a gem to grab a list of job announcements from [JobUp](http://www.jobup.ch) and put them 
into a form that is useful. The main motivation for this is the limited info provided by the user-configurable 
`JobMailers` which insist on only listing a maximum of 10 new positions in each email notification: not much 
help when there might be 60 or more posts to skim over.

This is my attempt at over-engineering something which is intrinsically very easy to do - for fun!

## How to use it

Add this line to your application's Gemfile:

    `gem 'JobUpScraper'`

And then execute:

    `$ bundle`

Or install it directly as:

    `$ gem install JobUpScraper`

## Usage

Run the example scraper script to see full usage information:

```
job_scraper -h
```

Here are some specific examples:

* **Running all searches**: `job_scraper`
* **Listing all configured searches**: Run `job_scraper --show` to list all configured searches and their parameters
* **Running a single search**: Run `job_scraper -j 12345` to run just the search identified by the id `12345`
* **Run a search; be persistent**: Run `job_scraper -e` to run a search and cache the results
* **Debug mode**: Use `-d` to turn on the debug flag and show more detailed output

### License

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
