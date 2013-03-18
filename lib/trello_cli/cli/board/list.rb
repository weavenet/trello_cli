module TrelloCli
  module CLI
    module Board
      class List

        def initialize
          @options = {}
        end

        def run
          option_parser.parse!

          list_boards.each do |list|
            name = list.attributes[:name]
            id   = list.attributes[:id]

            puts "#{name} ( #{id} )"
          end
        end

        private

        def list_boards
          lb = TrelloCli::Requests::ListBoards.new
          lb.list
        end

        def option_parser(options=@options)
          OptionParser.new do |opts|
            opts.banner = "Usage: trello board [list]"
          end
        end

        def help
          puts option_parser.help
        end

      end
    end
  end
end
