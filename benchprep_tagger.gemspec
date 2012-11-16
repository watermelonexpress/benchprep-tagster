$:.push File.expand_path('../lib', __FILE__)
Gem::Specification.new do |s|
  s.name        = 'benchprep_tagger'
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['benchprep']
  s.email       = ['developers@benchprep.com']
  s.homepage    = 'https://github.com/watermelonexpress/benchprep_tagger'
  s.summary     = %q{Benchprep Tagging System}

  s.bindir = 'bin'
  s.executables = %w{tag}
  # Load Paths...
  s.files = FileList['{bin,lib}/**/*', 'README.markdown'].to_a
  s.require_paths = ['lib']

  # Dependencies (installed via 'bundle install')...
  s.add_dependency('colored')
  s.add_dependency('virtus')
end

