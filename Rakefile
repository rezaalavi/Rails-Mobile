# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'rake/gempackagetask'

PKG_FILES = FileList[
  'Vendor/**/*'
]

spec = Gem::Specification.new do |s|
  s.name = "rails-mobile"
  s.version = "0.9.1"
  s.author = "Reza Alavi"
  s.email = "rezaalavi@rubyforge.org"
  s.homepage = "https://github.com/rezaalavi/Rails-Mobile"
  s.platform = Gem::Platform::RUBY
  s.rubyforge_project = "rails-mobile"
  s.summary = "Rails mobile is a Rails plug-in that adds mobile device recognition and dynamic controller/action switching to Rails."
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.add_dependency('mobilesrepo')
  s.extra_rdoc_files = ['README.rdoc']
end

desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

RailsMobileApp::Application.load_tasks
