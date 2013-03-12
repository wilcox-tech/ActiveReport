$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_report/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_report"
  s.version     = ActiveReport::VERSION
  s.authors     = ["Andrew Wilcox"]
  s.email       = ["awilcox@wilcox-tech.com"]
  s.homepage    = "https://github.com/wilcox-tech/ActiveReport"
  s.summary     = "Reports done the Rails Way."
  s.description = "Rails reporting gem aiming for the power of Java report libs and the simplicity of ActiveRecord."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"

  s.add_development_dependency "sqlite3"
end
