# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-odnoklassniki/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'

  gem.authors       = ['Alexander Logvinov']
  gem.email         = ['avl@logvinov.com"]
  gem.description   = %q{OmniAuth strategy for Odnoklassniki.ru}
  gem.summary       = %q{OmniAuth strategy for Odnoklassniki.ru}
  gem.homepage      = 'https://github.com/incubus/omniauth-odnoklassniki'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-odnoklassniki'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::Odnoklassniki::VERSION
end
