# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hpricot}
  s.version = "0.8.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["why the lucky stiff"]
  s.date = %q{2010-11-03}
  s.description = %q{a swift, liberal HTML parser with a fantastic library}
  s.email = %q{why@ruby-lang.org}
  s.extensions = ["ext/fast_xs/extconf.rb", "ext/hpricot_scan/extconf.rb"]
  s.extra_rdoc_files = ["README.md", "CHANGELOG", "COPYING"]
  s.files = ["CHANGELOG", "COPYING", "README.md", "Rakefile", "test/files/basic.xhtml", "test/files/boingboing.html", "test/files/cy0.html", "test/files/immob.html", "test/files/pace_application.html", "test/files/tenderlove.html", "test/files/uswebgen.html", "test/files/utf8.html", "test/files/week9.html", "test/files/why.xml", "test/load_files.rb", "test/nokogiri-bench.rb", "test/test_alter.rb", "test/test_builder.rb", "test/test_parser.rb", "test/test_paths.rb", "test/test_preserved.rb", "test/test_xml.rb", "extras/hpricot.png", "lib/hpricot/blankslate.rb", "lib/hpricot/builder.rb", "lib/hpricot/elements.rb", "lib/hpricot/htmlinfo.rb", "lib/hpricot/inspect.rb", "lib/hpricot/modules.rb", "lib/hpricot/parse.rb", "lib/hpricot/tag.rb", "lib/hpricot/tags.rb", "lib/hpricot/traverse.rb", "lib/hpricot/xchar.rb", "lib/hpricot.rb", "ext/hpricot_scan/hpricot_scan.h", "ext/fast_xs/FastXsService.java", "ext/hpricot_scan/HpricotCss.java", "ext/hpricot_scan/HpricotScanService.java", "ext/fast_xs/fast_xs.c", "ext/hpricot_scan/hpricot_css.c", "ext/hpricot_scan/hpricot_scan.c", "ext/fast_xs/extconf.rb", "ext/hpricot_scan/extconf.rb", "ext/hpricot_scan/hpricot_common.rl", "ext/hpricot_scan/hpricot_css.java.rl", "ext/hpricot_scan/hpricot_css.rl", "ext/hpricot_scan/hpricot_scan.java.rl", "ext/hpricot_scan/hpricot_scan.rl"]
  s.homepage = %q{http://code.whytheluckystiff.net/hpricot/}
  s.rdoc_options = ["--quiet", "--title", "The Hpricot Reference", "--main", "README.md", "--inline-source"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{hobix}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{a swift, liberal HTML parser with a fantastic library}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
