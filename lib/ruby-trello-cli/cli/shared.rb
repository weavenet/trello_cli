module RubyTrelloCli
  module CLI
    module Shared

      def actions(obj = self)
        (obj.methods - obj.class.superclass.instance_methods).sort
      end

      def parse_options
        option_parser.parse!
      end

      def help
        puts option_parser.help
      end

    end
  end
end
