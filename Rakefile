# frozen_string_literal: true

require 'bundler'
Bundler.setup

require 'rake'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

require 'yard'
YARD::Rake::YardocTask.new
