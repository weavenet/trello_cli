module TrelloCli
  module Formatters
    class CardList < Base
      def to_legacy
        msg = "Card Created.\n"
        msg << "Name        : #{data[:name]}\n"
        msg << "Description : #{data[:description]}\n"
      end

      def to_tsv
        data.map {|d| "#{d[:id]}\t#{d[:name]}\n"}
      end
    end
  end
end
