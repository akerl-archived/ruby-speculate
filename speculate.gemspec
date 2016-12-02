Gem::Specification.new do |s|
  s.name        = 'speculate'
  s.version     = '0.0.1'
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Tool for assuming roles in AWS accounts'
  s.description = "Tool for assuming roles in AWS accounts"
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/speculate'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split

  s.add_dependency 'aws-sdk', '~> 2.6.0'

  s.add_development_dependency 'rubocop', '~> 0.42.0'
  s.add_development_dependency 'rake', '~> 11.2.0'
  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'rspec', '~> 3.5.0'
  s.add_development_dependency 'fuubar', '~> 2.1.0'
end
