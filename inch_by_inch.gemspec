# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inch_by_inch/version'

Gem::Specification.new do |spec|
  spec.name          = 'inch_by_inch'
  spec.version       = InchByInch::VERSION
  spec.authors       = ['Marius Rackwitz', 'Samuel Giddins']
  spec.email         = ['gems@mariusrackwitz.de', 'segiddins@segiddins.me']

  spec.summary       = 'A rake task to pretty-print documentation violations.'
  spec.homepage      = 'https://github.com/segiddins/inch_by_inch'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'inch', '~> 0.8'
  spec.add_runtime_dependency 'rake'
end
