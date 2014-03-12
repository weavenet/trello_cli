module TrelloCli
  module CLI
    module Commands
      class Board

        include Shared

        def list
          ensure_credential_envs_set
          TrelloCli::CLI::Board::List.new.run
        end

      end
    end
  end
end
