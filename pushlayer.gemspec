$:.push File.expand_path('../lib', __FILE__)
require 'pushlayer/version'

Gem::Specification.new do |s|
  s.name        = 'pushlayer'
  s.version     = Pushlayer::VERSION
  s.authors     = ['Ryan Twomey, Costa Walcott']
  s.email       = ['info@pushlayer.com']
  s.homepage    = 'https://www.pushlayer.com'
  s.summary     = 'pushlayer sends iOS push notifications using PushLayer.com'

  s.description = <<-eodescription
PushLayer is a service for sending, managing, and debugging iOS push notifications. This gem
adds a wrapper around the service, making it simple to send iOS push notifications from within
your Ruby applications.
eodescription

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {spec}/*`.split("\n")

  s.required_ruby_version = Gem::Requirement.new('>= 1.9.2')
  s.require_paths = ['lib']

  s.add_dependency 'rest-client', '~> 1.6.7'
  s.add_dependency 'multi_json', '>= 1.0.4', '< 2'

  s.add_development_dependency 'rspec', '~> 2.0'
  s.add_development_dependency 'webmock', '~> 1.9.0'
end
