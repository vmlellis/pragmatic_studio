Gem::Specification.new do |s|
  s.name = "lellis_studio_game"
  s.version = "1.0.0"
  s.author = "Victor Lellis"
  s.email = "vmlellis@gmail.com"
  s.homepage = "http://lellis.info"
  s.summary = "Plays a game"
  s.license = 'MIT'
  s.description = File.read(File.join(File.dirname(__FILE__), 'README'))
  
  s.files = Dir["{bin,lib,spec}/**/*"] + %w(README)
  s.test_files = Dir["spec/**/*"]
  s.executables = [ 'studio_game' ]
  
  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
end