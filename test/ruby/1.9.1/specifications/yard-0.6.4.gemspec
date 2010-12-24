# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yard}
  s.version = "0.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Loren Segal"]
  s.date = %q{2010-12-20}
  s.description = %q{    YARD is a documentation generation tool for the Ruby programming language.
    It enables the user to generate consistent, usable documentation that can be
    exported to a number of formats very easily, and also supports extending for
    custom Ruby constructs such as custom class level definitions.
}
  s.email = %q{lsegal@soen.ca}
  s.executables = ["yard", "yardoc", "yri"]
  s.files = ["docs/CodeObjects.md", "docs/GettingStarted.md", "docs/Glossary.md", "docs/Handlers.md", "docs/images/code-objects-class-diagram.png", "docs/images/handlers-class-diagram.png", "docs/images/overview-class-diagram.png", "docs/images/parser-class-diagram.png", "docs/images/tags-class-diagram.png", "docs/Overview.md", "docs/Parser.md", "docs/Tags.md", "docs/Templates.md", "docs/WhatsNew.md", "bin/yard", "bin/yard-graph", "bin/yard-server", "bin/yardoc", "bin/yri", "lib/rubygems_plugin.rb", "lib/yard/autoload.rb", "lib/yard/cli/command.rb", "lib/yard/cli/command_parser.rb", "lib/yard/cli/config.rb", "lib/yard/cli/diff.rb", "lib/yard/cli/gems.rb", "lib/yard/cli/graph.rb", "lib/yard/cli/help.rb", "lib/yard/cli/server.rb", "lib/yard/cli/stats.rb", "lib/yard/cli/yardoc.rb", "lib/yard/cli/yri.rb", "lib/yard/code_objects/base.rb", "lib/yard/code_objects/class_object.rb", "lib/yard/code_objects/class_variable_object.rb", "lib/yard/code_objects/constant_object.rb", "lib/yard/code_objects/extended_method_object.rb", "lib/yard/code_objects/method_object.rb", "lib/yard/code_objects/module_object.rb", "lib/yard/code_objects/namespace_object.rb", "lib/yard/code_objects/proxy.rb", "lib/yard/code_objects/root_object.rb", "lib/yard/config.rb", "lib/yard/core_ext/array.rb", "lib/yard/core_ext/file.rb", "lib/yard/core_ext/hash.rb", "lib/yard/core_ext/insertion.rb", "lib/yard/core_ext/module.rb", "lib/yard/core_ext/string.rb", "lib/yard/core_ext/symbol_hash.rb", "lib/yard/docstring.rb", "lib/yard/globals.rb", "lib/yard/handlers/base.rb", "lib/yard/handlers/processor.rb", "lib/yard/handlers/ruby/alias_handler.rb", "lib/yard/handlers/ruby/attribute_handler.rb", "lib/yard/handlers/ruby/base.rb", "lib/yard/handlers/ruby/class_condition_handler.rb", "lib/yard/handlers/ruby/class_handler.rb", "lib/yard/handlers/ruby/class_variable_handler.rb", "lib/yard/handlers/ruby/constant_handler.rb", "lib/yard/handlers/ruby/exception_handler.rb", "lib/yard/handlers/ruby/extend_handler.rb", "lib/yard/handlers/ruby/legacy/alias_handler.rb", "lib/yard/handlers/ruby/legacy/attribute_handler.rb", "lib/yard/handlers/ruby/legacy/base.rb", "lib/yard/handlers/ruby/legacy/class_condition_handler.rb", "lib/yard/handlers/ruby/legacy/class_handler.rb", "lib/yard/handlers/ruby/legacy/class_variable_handler.rb", "lib/yard/handlers/ruby/legacy/constant_handler.rb", "lib/yard/handlers/ruby/legacy/exception_handler.rb", "lib/yard/handlers/ruby/legacy/extend_handler.rb", "lib/yard/handlers/ruby/legacy/method_handler.rb", "lib/yard/handlers/ruby/legacy/mixin_handler.rb", "lib/yard/handlers/ruby/legacy/module_handler.rb", "lib/yard/handlers/ruby/legacy/process_handler.rb", "lib/yard/handlers/ruby/legacy/visibility_handler.rb", "lib/yard/handlers/ruby/legacy/yield_handler.rb", "lib/yard/handlers/ruby/method_condition_handler.rb", "lib/yard/handlers/ruby/method_handler.rb", "lib/yard/handlers/ruby/mixin_handler.rb", "lib/yard/handlers/ruby/module_handler.rb", "lib/yard/handlers/ruby/process_handler.rb", "lib/yard/handlers/ruby/struct_handler_methods.rb", "lib/yard/handlers/ruby/visibility_handler.rb", "lib/yard/handlers/ruby/yield_handler.rb", "lib/yard/logging.rb", "lib/yard/parser/base.rb", "lib/yard/parser/c_parser.rb", "lib/yard/parser/ruby/ast_node.rb", "lib/yard/parser/ruby/legacy/ruby_lex.rb", "lib/yard/parser/ruby/legacy/ruby_parser.rb", "lib/yard/parser/ruby/legacy/statement.rb", "lib/yard/parser/ruby/legacy/statement_list.rb", "lib/yard/parser/ruby/legacy/token_list.rb", "lib/yard/parser/ruby/ruby_parser.rb", "lib/yard/parser/source_parser.rb", "lib/yard/rake/yardoc_task.rb", "lib/yard/registry.rb", "lib/yard/registry_store.rb", "lib/yard/serializers/base.rb", "lib/yard/serializers/file_system_serializer.rb", "lib/yard/serializers/process_serializer.rb", "lib/yard/serializers/stdout_serializer.rb", "lib/yard/serializers/yardoc_serializer.rb", "lib/yard/server/adapter.rb", "lib/yard/server/commands/base.rb", "lib/yard/server/commands/display_file_command.rb", "lib/yard/server/commands/display_object_command.rb", "lib/yard/server/commands/frames_command.rb", "lib/yard/server/commands/library_command.rb", "lib/yard/server/commands/library_index_command.rb", "lib/yard/server/commands/list_command.rb", "lib/yard/server/commands/search_command.rb", "lib/yard/server/commands/static_file_command.rb", "lib/yard/server/doc_server_helper.rb", "lib/yard/server/doc_server_serializer.rb", "lib/yard/server/library_version.rb", "lib/yard/server/rack_adapter.rb", "lib/yard/server/router.rb", "lib/yard/server/static_caching.rb", "lib/yard/server/templates/default/fulldoc/html/css/custom.css", "lib/yard/server/templates/default/fulldoc/html/images/processing.gif", "lib/yard/server/templates/default/fulldoc/html/js/autocomplete.js", "lib/yard/server/templates/default/fulldoc/html/js/live.js", "lib/yard/server/templates/default/layout/html/breadcrumb.erb", "lib/yard/server/templates/default/layout/html/headers.erb", "lib/yard/server/templates/doc_server/frames/html/frames.erb", "lib/yard/server/templates/doc_server/frames/html/setup.rb", "lib/yard/server/templates/doc_server/full_list/html/full_list.erb", "lib/yard/server/templates/doc_server/full_list/html/setup.rb", "lib/yard/server/templates/doc_server/library_list/html/contents.erb", "lib/yard/server/templates/doc_server/library_list/html/headers.erb", "lib/yard/server/templates/doc_server/library_list/html/library_list.erb", "lib/yard/server/templates/doc_server/library_list/html/setup.rb", "lib/yard/server/templates/doc_server/library_list/html/title.erb", "lib/yard/server/templates/doc_server/processing/html/processing.erb", "lib/yard/server/templates/doc_server/processing/html/setup.rb", "lib/yard/server/templates/doc_server/search/html/search.erb", "lib/yard/server/templates/doc_server/search/html/setup.rb", "lib/yard/server/webrick_adapter.rb", "lib/yard/server.rb", "lib/yard/tags/default_factory.rb", "lib/yard/tags/default_tag.rb", "lib/yard/tags/library.rb", "lib/yard/tags/option_tag.rb", "lib/yard/tags/overload_tag.rb", "lib/yard/tags/ref_tag.rb", "lib/yard/tags/ref_tag_list.rb", "lib/yard/tags/tag.rb", "lib/yard/tags/tag_format_error.rb", "lib/yard/templates/engine.rb", "lib/yard/templates/erb_cache.rb", "lib/yard/templates/helpers/base_helper.rb", "lib/yard/templates/helpers/filter_helper.rb", "lib/yard/templates/helpers/html_helper.rb", "lib/yard/templates/helpers/html_syntax_highlight_helper.rb", "lib/yard/templates/helpers/html_syntax_highlight_helper18.rb", "lib/yard/templates/helpers/markup_helper.rb", "lib/yard/templates/helpers/method_helper.rb", "lib/yard/templates/helpers/module_helper.rb", "lib/yard/templates/helpers/text_helper.rb", "lib/yard/templates/helpers/uml_helper.rb", "lib/yard/templates/section.rb", "lib/yard/templates/template.rb", "lib/yard/verifier.rb", "lib/yard.rb", "spec/cli/command_parser_spec.rb", "spec/cli/config_spec.rb", "spec/cli/diff_spec.rb", "spec/cli/gems_spec.rb", "spec/cli/help_spec.rb", "spec/cli/server_spec.rb", "spec/cli/stats_spec.rb", "spec/cli/yardoc_spec.rb", "spec/cli/yri_spec.rb", "spec/code_objects/base_spec.rb", "spec/code_objects/class_object_spec.rb", "spec/code_objects/code_object_list_spec.rb", "spec/code_objects/constants_spec.rb", "spec/code_objects/method_object_spec.rb", "spec/code_objects/module_object_spec.rb", "spec/code_objects/namespace_object_spec.rb", "spec/code_objects/proxy_spec.rb", "spec/code_objects/spec_helper.rb", "spec/config_spec.rb", "spec/core_ext/array_spec.rb", "spec/core_ext/file_spec.rb", "spec/core_ext/hash_spec.rb", "spec/core_ext/insertion_spec.rb", "spec/core_ext/module_spec.rb", "spec/core_ext/string_spec.rb", "spec/core_ext/symbol_hash_spec.rb", "spec/docstring_spec.rb", "spec/handlers/alias_handler_spec.rb", "spec/handlers/attribute_handler_spec.rb", "spec/handlers/base_spec.rb", "spec/handlers/class_condition_handler_spec.rb", "spec/handlers/class_handler_spec.rb", "spec/handlers/class_variable_handler_spec.rb", "spec/handlers/constant_handler_spec.rb", "spec/handlers/examples/alias_handler_001.rb.txt", "spec/handlers/examples/attribute_handler_001.rb.txt", "spec/handlers/examples/class_condition_handler_001.rb.txt", "spec/handlers/examples/class_handler_001.rb.txt", "spec/handlers/examples/class_variable_handler_001.rb.txt", "spec/handlers/examples/constant_handler_001.rb.txt", "spec/handlers/examples/exception_handler_001.rb.txt", "spec/handlers/examples/extend_handler_001.rb.txt", "spec/handlers/examples/method_condition_handler_001.rb.txt", "spec/handlers/examples/method_handler_001.rb.txt", "spec/handlers/examples/mixin_handler_001.rb.txt", "spec/handlers/examples/module_handler_001.rb.txt", "spec/handlers/examples/process_handler_001.rb.txt", "spec/handlers/examples/visibility_handler_001.rb.txt", "spec/handlers/examples/yield_handler_001.rb.txt", "spec/handlers/exception_handler_spec.rb", "spec/handlers/extend_handler_spec.rb", "spec/handlers/legacy_base_spec.rb", "spec/handlers/method_condition_handler_spec.rb", "spec/handlers/method_handler_spec.rb", "spec/handlers/mixin_handler_spec.rb", "spec/handlers/module_handler_spec.rb", "spec/handlers/process_handler_spec.rb", "spec/handlers/processor_spec.rb", "spec/handlers/ruby/base_spec.rb", "spec/handlers/ruby/legacy/base_spec.rb", "spec/handlers/spec_helper.rb", "spec/handlers/visibility_handler_spec.rb", "spec/handlers/yield_handler_spec.rb", "spec/parser/base_spec.rb", "spec/parser/c_parser_spec.rb", "spec/parser/examples/array.c.txt", "spec/parser/examples/example1.rb.txt", "spec/parser/examples/override.c.txt", "spec/parser/examples/parse_in_order_001.rb.txt", "spec/parser/examples/parse_in_order_002.rb.txt", "spec/parser/examples/tag_handler_001.rb.txt", "spec/parser/ruby/ast_node_spec.rb", "spec/parser/ruby/legacy/statement_list_spec.rb", "spec/parser/ruby/legacy/token_list_spec.rb", "spec/parser/ruby/ruby_parser_spec.rb", "spec/parser/source_parser_spec.rb", "spec/parser/tag_parsing_spec.rb", "spec/rake/yardoc_task_spec.rb", "spec/registry_spec.rb", "spec/registry_store_spec.rb", "spec/serializers/data/serialized_yardoc/checksums", "spec/serializers/data/serialized_yardoc/objects/Foo/bar_i.dat", "spec/serializers/data/serialized_yardoc/objects/Foo/baz_i.dat", "spec/serializers/data/serialized_yardoc/objects/Foo.dat", "spec/serializers/data/serialized_yardoc/objects/root.dat", "spec/serializers/data/serialized_yardoc/proxy_types", "spec/serializers/file_system_serializer_spec.rb", "spec/serializers/spec_helper.rb", "spec/serializers/yardoc_serializer_spec.rb", "spec/server/adapter_spec.rb", "spec/server/commands/base_spec.rb", "spec/server/commands/static_file_command_spec.rb", "spec/server/doc_server_serializer_spec.rb", "spec/server/rack_adapter_spec.rb", "spec/server/router_spec.rb", "spec/server/spec_helper.rb", "spec/server/static_caching_spec.rb", "spec/server/webrick_servlet_spec.rb", "spec/server_spec.rb", "spec/spec_helper.rb", "spec/tags/default_factory_spec.rb", "spec/tags/default_tag_spec.rb", "spec/tags/library_spec.rb", "spec/tags/overload_tag_spec.rb", "spec/tags/ref_tag_list_spec.rb", "spec/templates/class_spec.rb", "spec/templates/constant_spec.rb", "spec/templates/engine_spec.rb", "spec/templates/examples/class001.html", "spec/templates/examples/class001.txt", "spec/templates/examples/class002.html", "spec/templates/examples/constant001.txt", "spec/templates/examples/constant002.txt", "spec/templates/examples/constant003.txt", "spec/templates/examples/method001.html", "spec/templates/examples/method001.txt", "spec/templates/examples/method002.html", "spec/templates/examples/method002.txt", "spec/templates/examples/method003.html", "spec/templates/examples/method003.txt", "spec/templates/examples/method004.html", "spec/templates/examples/method004.txt", "spec/templates/examples/method005.html", "spec/templates/examples/method005.txt", "spec/templates/examples/module001.dot", "spec/templates/examples/module001.html", "spec/templates/examples/module001.txt", "spec/templates/examples/module002.html", "spec/templates/examples/tag001.txt", "spec/templates/helpers/base_helper_spec.rb", "spec/templates/helpers/html_helper_spec.rb", "spec/templates/helpers/html_syntax_highlight_helper_spec.rb", "spec/templates/helpers/markup_helper_spec.rb", "spec/templates/helpers/method_helper_spec.rb", "spec/templates/helpers/shared_signature_examples.rb", "spec/templates/helpers/text_helper_spec.rb", "spec/templates/method_spec.rb", "spec/templates/module_spec.rb", "spec/templates/section_spec.rb", "spec/templates/spec_helper.rb", "spec/templates/tag_spec.rb", "spec/templates/template_spec.rb", "spec/verifier_spec.rb", "templates/default/class/dot/setup.rb", "templates/default/class/dot/superklass.erb", "templates/default/class/html/constructor_details.erb", "templates/default/class/html/setup.rb", "templates/default/class/html/subclasses.erb", "templates/default/class/setup.rb", "templates/default/class/text/setup.rb", "templates/default/class/text/subclasses.erb", "templates/default/constant/text/header.erb", "templates/default/constant/text/setup.rb", "templates/default/docstring/html/abstract.erb", "templates/default/docstring/html/deprecated.erb", "templates/default/docstring/html/index.erb", "templates/default/docstring/html/note.erb", "templates/default/docstring/html/private.erb", "templates/default/docstring/html/returns_void.erb", "templates/default/docstring/html/text.erb", "templates/default/docstring/html/todo.erb", "templates/default/docstring/setup.rb", "templates/default/docstring/text/abstract.erb", "templates/default/docstring/text/deprecated.erb", "templates/default/docstring/text/index.erb", "templates/default/docstring/text/note.erb", "templates/default/docstring/text/private.erb", "templates/default/docstring/text/returns_void.erb", "templates/default/docstring/text/text.erb", "templates/default/docstring/text/todo.erb", "templates/default/fulldoc/html/css/common.css", "templates/default/fulldoc/html/css/full_list.css", "templates/default/fulldoc/html/css/style.css", "templates/default/fulldoc/html/frames.erb", "templates/default/fulldoc/html/full_list.erb", "templates/default/fulldoc/html/full_list_class.erb", "templates/default/fulldoc/html/full_list_files.erb", "templates/default/fulldoc/html/full_list_methods.erb", "templates/default/fulldoc/html/js/app.js", "templates/default/fulldoc/html/js/full_list.js", "templates/default/fulldoc/html/js/jquery.js", "templates/default/fulldoc/html/setup.rb", "templates/default/layout/dot/header.erb", "templates/default/layout/dot/setup.rb", "templates/default/layout/html/breadcrumb.erb", "templates/default/layout/html/footer.erb", "templates/default/layout/html/headers.erb", "templates/default/layout/html/index.erb", "templates/default/layout/html/layout.erb", "templates/default/layout/html/search.erb", "templates/default/layout/html/setup.rb", "templates/default/method/html/header.erb", "templates/default/method/setup.rb", "templates/default/method/text/header.erb", "templates/default/method_details/html/header.erb", "templates/default/method_details/html/method_signature.erb", "templates/default/method_details/html/source.erb", "templates/default/method_details/setup.rb", "templates/default/method_details/text/header.erb", "templates/default/method_details/text/method_signature.erb", "templates/default/method_details/text/setup.rb", "templates/default/module/dot/child.erb", "templates/default/module/dot/dependencies.erb", "templates/default/module/dot/header.erb", "templates/default/module/dot/info.erb", "templates/default/module/dot/setup.rb", "templates/default/module/html/attribute_details.erb", "templates/default/module/html/attribute_summary.erb", "templates/default/module/html/box_info.erb", "templates/default/module/html/children.erb", "templates/default/module/html/constant_summary.erb", "templates/default/module/html/defines.erb", "templates/default/module/html/header.erb", "templates/default/module/html/inherited_constants.erb", "templates/default/module/html/inherited_methods.erb", "templates/default/module/html/item_summary.erb", "templates/default/module/html/method_details_list.erb", "templates/default/module/html/method_summary.erb", "templates/default/module/html/methodmissing.erb", "templates/default/module/html/pre_docstring.erb", "templates/default/module/setup.rb", "templates/default/module/text/children.erb", "templates/default/module/text/class_meths_list.erb", "templates/default/module/text/extends.erb", "templates/default/module/text/header.erb", "templates/default/module/text/includes.erb", "templates/default/module/text/instance_meths_list.erb", "templates/default/module/text/setup.rb", "templates/default/onefile/html/files.erb", "templates/default/onefile/html/layout.erb", "templates/default/onefile/html/readme.erb", "templates/default/onefile/html/setup.rb", "templates/default/root/dot/child.erb", "templates/default/root/dot/setup.rb", "templates/default/root/html/setup.rb", "templates/default/tags/html/example.erb", "templates/default/tags/html/index.erb", "templates/default/tags/html/option.erb", "templates/default/tags/html/overload.erb", "templates/default/tags/html/see.erb", "templates/default/tags/html/tag.erb", "templates/default/tags/setup.rb", "templates/default/tags/text/example.erb", "templates/default/tags/text/index.erb", "templates/default/tags/text/option.erb", "templates/default/tags/text/overload.erb", "templates/default/tags/text/see.erb", "templates/default/tags/text/tag.erb", "benchmarks/builtins_vs_eval.rb", "benchmarks/concat_vs_join.rb", "benchmarks/erb_vs_erubis.rb", "benchmarks/format_args.rb", "benchmarks/generation.rb", "benchmarks/marshal_vs_dbm.rb", "benchmarks/parsing.rb", "benchmarks/pathname_vs_string.rb", "benchmarks/rdoc_vs_yardoc.rb", "benchmarks/ri_vs_yri.rb", "benchmarks/ripper_parser.rb", "benchmarks/template_erb.rb", "benchmarks/template_format.rb", "benchmarks/template_profile.rb", "benchmarks/yri_cache.rb", "ChangeLog", "LICENSE", "LEGAL", "README.md", "Rakefile", ".yardopts"]
  s.homepage = %q{http://yardoc.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{yard}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Documentation tool for consistent and usable documentation in Ruby.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
