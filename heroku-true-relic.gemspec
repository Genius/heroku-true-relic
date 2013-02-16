$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "heroku-true-relic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "heroku-true-relic"
  s.version     = HerokuTrueRelic::VERSION
  s.authors     = ["Andrew Warner"]
  s.email       = ["andrew@rapgenius.com"]
  s.homepage    = "rapgenius.com"
  s.summary     = "Get accurate heroku queue times in new relic"
  s.description = <<-DESCRIPTION
  New Relic (on Heroku) currently reports queue times as queuing at the router level. The goal
  of this gem is to provide new relic with the proper queueing time for requests, which takes
  into account queue time at the dyno level.
  DESCRIPTION

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"

  s.add_development_dependency "sqlite3"
end
