require 'rake/testtask'
require 'rspec/core/rake_task'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/unit/tc_test_*.rb']
  t.verbose = true
end

#### Spec ####
RSpec::Core::RakeTask.new(:spec) do |config|
  config.rcov = true
end

task :default => :spec

require 'rspec/autorun'
