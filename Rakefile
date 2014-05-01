require 'rake/testtask'
require 'rspec/core/rake_task'

require 'nokogiri'
require 'open-uri'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/unit/tc_test_*.rb']
  t.verbose = true
end

#### Spec ####
RSpec::Core::RakeTask.new(:spec) do |config|
  config.verbose = true
end

task :default => :spec

require 'rspec/autorun'
