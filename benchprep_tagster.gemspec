$:.push File.expand_path('../lib', __FILE__)

require "benchprep_tagster/version"

Gem::Specification.new do |s|
  s.name        = 'benchprep_tagster'
  s.version     = Benchprep::Tagster::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['benchprep']
  s.email       = ['developers@benchprep.com']
  s.homepage    = 'https://github.com/watermelonexpress/benchprep-tagster'
  s.summary     = %q{Benchprep Tagging Crew}

  s.bindir        = 'bin'
  s.executables   = %w{tag prepare}
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency('colored')
end
