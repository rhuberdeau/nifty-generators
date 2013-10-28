Gem::Specification.new do |s|
  s.name        = "nifty-generators"
  s.version     = "0.4.6"
  s.author      = "Ryan Bates"
  s.email       = "ryan@railscasts.com"
  s.homepage    = "http://github.com/ryanb/nifty-generators"
  s.summary     = "A collection of useful Rails generator scripts."
  s.description = "A collection of useful Rails generator scripts for scaffolding, layout files, authentication, and more."

  s.files        = Dir["{lib,test,features,rails_generators}/**/*", "[A-Z]*"]
  s.require_path = "lib"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rails', '~> 4.0.0'
  s.add_development_dependency 'mocha' 
  s.add_development_dependency 'bcrypt-ruby', '~> 2.1.2'
  s.add_development_dependency 'sqlite3', '~> 1.3.8'

  s.rubyforge_project = s.name
  #s.required_rubygems_version = ">= 1.3.4"
end
