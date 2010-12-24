module YARD
  module Parser
    module Ruby
      module Legacy
        # Legacy Ruby parser
        # @since 0.5.6
        class RubyParser < Parser::Base
          def initialize(source, filename)
            @source = source
          end
          
          def parse
            @parse ||= StatementList.new(@source)
          end
          
          def tokenize
            @tokenize ||= TokenList.new(@source)
          end
          
          def enumerator
            @parse
          end
        end
      end
    end
  end
end