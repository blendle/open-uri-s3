lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "open-uri-s3/version"

Gem::Specification.new do |s|
  s.name        = "open-uri-s3"
  s.version     = OpenURIS3::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Erik Terpstra", "Jan-Willem van der Meer"]
  s.email       = ["erik@blendle.com", "janwillem@blendle.com"]
  s.homepage    = "http://github.com/blendle/open-uri-s3"
  s.summary     = "AWS S3 protocol support for open-uri"
  s.description = "AWS S3 protocol support for open-uri"

  s.required_rubygems_version = ">= 1.3.6"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE.txt", "*.md"]
  s.require_path = 'lib'

  s.add_runtime_dependency "aws-sdk-v1"

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'yard'
end
