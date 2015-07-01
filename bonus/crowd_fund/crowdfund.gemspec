Gem::Specification.new do |s|
  s.name         = "crowdfund"
  s.version      = "1.0.0"
  s.author       = "Victor Lellis"
  s.email        = "vitor@lellis.info"
  s.homepage     = "https://github.com/vmlellis/pragmatic_studio"
  s.summary      = "Pragmatic Studio Project"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'crowdfund' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 0'
end