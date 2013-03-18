module TrelloCli
  module CLI
    module Commands
      class Card

        include Shared

        def create
          TrelloCli::CLI::Card::Create.new.run
        end

        def list
          TrelloCli::CLI::Card::List.new.run
        end

      end
    end
  end
end
