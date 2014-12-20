require 'json'

module TrelloCli
  module Formatters
    class Basic
      def initialize(data)
        @data = data
      end

      def output(format)
        case format
        when "json"
          self.to_json
        when "tsv"
          self.to_tsv
        else
          self.to_legacy
        end
      end

      def to_json
        data.to_json
      end

      private

      attr_reader :data
    end
  end
end
