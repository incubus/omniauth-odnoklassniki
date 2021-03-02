# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-odnoklassniki/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-odnoklassniki"
  s.version     = Omniauth::Odnoklassniki::VERSION
  s.authors     = ["Alexander Logvinov"]
  s.email       = ["avl@logvinov.com"]
  s.homepage    = "https://github.com/incubus/omniauth-odnoklassniki"
  s.summary     = %q{OmniAuth strategy for Odnoklassniki.ru}
  s.description = %q{OmniAuth strategy for Odnoklassniki.ru}

  s.rubyforge_project = "omniauth-odnoklassniki"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "omniauth", [">= 1.9", "< 3"]
  s.add_runtime_dependency "omniauth-oauth2", "~> 1.0"
end
