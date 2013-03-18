module TrelloCli
  module CLI
    module Commands
      class List

        include Shared

        def list
          TrelloCli::CLI::List::List.new.run
        end

      end
    end
  end
end
