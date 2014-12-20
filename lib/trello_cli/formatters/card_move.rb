module TrelloCli
  module Formatters
    class CardMove < Base
      def to_legacy
        if data[:success]
          "Card #{data[:card_id]} was succesfully moved to #{data[:list_id]}.\n"
        else
          "Error moving card."
        end
      end

      def to_tsv
        [data[:success], data[:card_id], data[:list_id]].join("\t") + "\n"
      end
    end
  end
end
