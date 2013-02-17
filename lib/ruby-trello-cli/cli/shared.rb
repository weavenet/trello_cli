module RubyTrelloCli
  module CLI
    module Shared
      def actions(obj = self)
        (obj.methods - obj.class.superclass.instance_methods).sort
      end
    end
  end
end
