# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'rbpay'
  s.version = '0.0.0'
  s.author = 'Yuri Chandra | yurichandra'
  s.summary = 'Rbpay is Indonesia payment gateway wrapper. Support Xendit.'
  s.description = 'Rbpay is Indonesia payment gateway wrapper. Support Xendit.'
  s.required_ruby_version = '>= 2.6.5'
  s.files = Dir['lib/**/*', '.rubocop.yml']
  s.license = 'MIT'

  # for dependency
  s.add_development_dependency 'rspec', '~> 3.10.0'
  s.add_development_dependency 'simplecov', '~> 0.21.2'
  s.add_development_dependency 'vcr', '~> 6.0.0'
end
