require "bundler/gem_tasks"

task default: 'test'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/*test.rb"
end
