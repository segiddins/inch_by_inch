task :default => [:inch, :rubocop]

task :bootstrap do
  sh 'bundle install'
end

begin
  require 'bundler/gem_tasks'
  require 'bundler/setup'

  require 'inch_by_inch/rake_task'
  InchByInch::RakeTask.new

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError, NameError => e
  $stderr.puts "\033[0;31m" \
    '[!] Some Rake tasks haven been disabled because the environment' \
    ' couldn’t be loaded. Be sure to run `rake bootstrap` first or use the ' \
    "VERBOSE environment variable to see errors.\e[0m"
  if ENV['VERBOSE']
    $stderr.puts e.message
    $stderr.puts e.backtrace
    $stderr.puts
  end
end
