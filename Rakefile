# frozen_string_literal: true

begin
  require "gemsmith/rake/setup"
  require "rspec/core/rake_task"
  require "rubocop/rake_task"
  # require "scss_lint/rake_task"

  RSpec::Core::RakeTask.new(:spec)
  RuboCop::RakeTask.new
  # SCSSLint::RakeTask.new { |task| task.files = ["app/assets"] }
rescue LoadError => error
  puts error.message
end

# https://stackoverflow.com/a/23779044
task :console do
  exec "pry -r acv2lrtemplate -I ./lib"
end

desc "Run code quality checks"
task code_quality: %i[rubocop]

task default: %i[spec]
