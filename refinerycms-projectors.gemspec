# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-projectors'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Projectors extension for Refinery CMS'
  s.date              = '2012-10-21'
  s.summary           = 'Projectors extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.author           = 'Benjamin Richter'

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.8'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.8'
end
