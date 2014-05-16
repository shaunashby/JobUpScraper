# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'job_up/version'

Gem::Specification.new do |spec|
  spec.name          = "JobUpScraper"
  spec.version       = JobUp::VERSION
  spec.authors       = ["Shaun Ashby"]
  spec.email         = ["Shaun.Ashby@gmail.com"]
  spec.description   = %q{A gem for scraping a job site and massaging the results into digestible form.}
  spec.summary       = %q{TODO}
  spec.homepage      = ""
  spec.license       = "GPLv3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cucumber"
end
