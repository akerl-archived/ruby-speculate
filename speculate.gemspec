$:.unshift File.expand_path('../lib/', __FILE__)
require 'speculate/version'

Gem::Specification.new do |s|
  s.name        = 'speculate'
  s.version     = Speculate::VERSION
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Tool for assuming roles in AWS accounts'
  s.description = "Tool for assuming roles in AWS accounts"
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/speculate'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split
  s.executables = ['speculate']

  s.add_dependency 'aws-sdk', '~> 2.6.0'

  s.add_development_dependency 'rubocop', '~> 0.46.0'
  s.add_development_dependency 'rake', '~> 11.3.0'
  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'rspec', '~> 3.5.0'
  s.add_development_dependency 'fuubar', '~> 2.2.0'
end
