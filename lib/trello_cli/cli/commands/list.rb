module TrelloCli
  module CLI
    module Commands
      class List

        include Shared

        def list
          ensure_credential_envs_set
          TrelloCli::CLI::List::List.new.run
        end

      end
    end
  end
end
