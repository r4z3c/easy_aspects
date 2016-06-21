$:.push File.expand_path('../lib', __FILE__)

require 'easy_aspects/version'

Gem::Specification.new do |s|
  s.name        = 'easy_aspects'
  s.version     = EasyAspects::VERSION
  s.authors     = ['r4z3c']
  s.email       = ['r4z3c.43@gmail.com']
  s.homepage    = 'https://github.com/r4z3c/easy_aspects.git'
  s.summary     = 'Modularize your application aspects'
  s.summary     = 'Modularize your application aspects'
  s.description = 'Provides a way to design and implement application aspects, through isolated modules'
  s.licenses    = %w(MIT)

  s.files = `git ls-files`.split("\n")
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  s.require_paths = %w(lib)

  s.add_dependency 'bundler', '~>1'
  s.add_dependency 'activesupport', '~>4'
  s.add_dependency 'easy_callbacks', '~>0'

  s.add_development_dependency 'rspec', '~>3'
  s.add_development_dependency 'simplecov', '~>0'
  s.add_development_dependency 'model-builder', '~>2'
end
