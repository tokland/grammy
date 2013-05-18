
require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rubygems/package_task'
require 'rdoc/task'
require 'rake/testtask'

spec = Gem::Specification.new do |s|
  s.name = 'Grammy'
  s.version = '0.0.9'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.markdown']
  s.summary = 'Grammy is a DSL to describe Grammars and gernerate RD Parsers from these descriptions'
  s.description = s.summary
  s.author = 'Ragmaanir'
  s.email = 'ragmaanir@gmail.com'
  s.homepage = 'http://ragmaanir.mypresident.de'
  s.files = %w(README Rakefile) + Dir.glob("{lib,spec}/**/*")
  s.require_path = "lib"
  s.add_dependency('log4r', '>= 1.1.8')
  s.add_dependency('rspec', '>= 1.3.0')
  s.add_dependency('ruby-graphviz', '>= 0.9.12')
end
