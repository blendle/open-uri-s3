# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open-uri-s3/version'

Gem::Specification.new do |s|
  s.name = OpenURIS3::Version
  s.version = '1.6.0'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.require_paths = ['lib']
  s.authors = ['Erik Terpstra']
  s.date = '2016-04-23'
  s.description = 'AWS S3 protocol support for open-uri'
  s.email = 'erterpstra@gmail.com'
  s.extra_rdoc_files = [
    'LICENSE.txt',
    'README.md'
  ]

  s.files = `git ls-files -z`.split("\x0").reject{ |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage         = 'http://github.com/eterps/open-uri-s3'
  s.licenses         = ['MIT']
  s.rubygems_version = '2.4.8'
  s.summary          = 'AWS S3 protocol support for open-uri'

  spec.add_dependency 'aws-sdk-v1'

  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency 'yard', '~> 0.7'
  spec.add_development_dependency 'rdoc', '~> 3.12'
  spec.add_development_dependency 'bundler', '~> 1.0'
end
