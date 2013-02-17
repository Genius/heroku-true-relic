#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'HerokuTrueRelic'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

desc 'Default: Run all specs.'
task :default => 'all:spec'

namespace :all do
  desc "Run specs on all spec apps"
  task :spec do
    for_each_directory_of('spec/**/Rakefile', "Failed to run specs") do |directory|
      system("BUNDLE_GEMFILE='./Gemfile' bundle exec rake spec")
    end
  end

  desc "Bundle all spec apps"
  task :bundle do
    for_each_directory_of('spec/**/Gemfile', 'Failed to bundle') do |directory|
      system("BUNDLE_GEMFILE='./Gemfile' bundle install")
    end
  end
end

def for_each_directory_of(path, fail_msg, &block)
  results = Dir[path].sort.map do |file|
    directory = File.dirname(file)
    puts '', "\033[44m#{directory}\033[0m", ''
    result = nil
    Dir.chdir(directory) do
      result = block.call(directory)
    end
    result
  end

  fail fail_msg unless results.all?
end
