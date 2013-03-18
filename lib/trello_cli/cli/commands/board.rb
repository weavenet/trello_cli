module TrelloCli
  module CLI
    module Commands
      class Board

        include Shared

        def list
          TrelloCli::CLI::Board::List.new.run
        end

      end
    end
  end
end
