# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{xpath}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jonas Nicklas"]
  s.date = %q{2010-10-07}
  s.description = %q{XPath is a Ruby DSL for generating XPath expressions}
  s.email = ["jonas.nicklas@gmail.com"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["lib/xpath/expression.rb", "lib/xpath/html.rb", "lib/xpath/union.rb", "lib/xpath/version.rb", "lib/xpath.rb", "spec/fixtures/form.html", "spec/fixtures/simple.html", "spec/fixtures/stuff.html", "spec/html_spec.rb", "spec/spec_helper.rb", "spec/union_spec.rb", "spec/xpath_spec.rb", "README.rdoc"]
  s.homepage = %q{http://github.com/jnicklas/xpath}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{xpath}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Generate XPath expressions from Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.3"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<yard>, [">= 0.5.8"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.3"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<yard>, [">= 0.5.8"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.3"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<yard>, [">= 0.5.8"])
  end
end
