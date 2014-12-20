module TrelloCli
  module Formatters
    class CardCreate < Base
      def to_legacy
        msg = "Card Created.\n"
        msg << "Name        : #{data[:name]}\n"
        msg << "Description : #{data[:desc]}\n"
      end

      def to_tsv
        [data[:id], data[:name], data[:desc]].join("\t") + "\n"
      end
    end
  end
end
