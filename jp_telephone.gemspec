# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jp_telephone/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["koshigoe"]
  gem.email         = ["koshigoeb@gmail.com"]
  gem.description   = %q{Parse Japanese telephone number.}
  gem.summary       = %q{Parse Japanese telephone number.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jp_telephone"
  gem.require_paths = ["lib"]
  gem.version       = JpTelephone::VERSION
end
