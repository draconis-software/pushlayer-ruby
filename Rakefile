#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rspec/core/rake_task'

begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Pushlayer'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :spec do
  desc 'Run unit specs'
  RSpec::Core::RakeTask.new('unit') do |t|
    t.pattern = 'spec/unit/**/*_spec.rb'
  end

  desc 'Run functional specs'
  RSpec::Core::RakeTask.new('functional') do |t|
    t.pattern = 'spec/functional/**/*_spec.rb'
  end
end

desc 'Run unit and functional specs'
task spec: ['spec:unit', 'spec:functional']

task default: :spec
