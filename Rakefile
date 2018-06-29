require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :console do
  exec "pry -r acv2lrtemplate -I ./lib"
end

task :default => :spec
