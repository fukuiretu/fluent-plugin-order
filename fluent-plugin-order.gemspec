# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-order"
  spec.version       = "0.0.1"
  spec.authors       = ["Fukui ReTu"]
  spec.email         = ["s0232101@gmail.com"]
  spec.description   = %q{Output filter plugin to rearrange the order of the elements}
  spec.summary       = %q{Output filter plugin to rearrange the order of the elements}
  spec.homepage      = "https://github.com/fukuiretu/fluent-plugin-order"
  spec.license       = "APL2.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end