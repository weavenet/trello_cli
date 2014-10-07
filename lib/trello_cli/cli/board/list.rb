module TrelloCli
  module CLI
    module Board
      class List

        def initialize
          @options = {}
        end

        def run
          option_parser.parse!

          list_boards.each do |board|
            return unless !board.attributes[:closed] || @options[:closed]
            name = board.attributes[:name]
            id   = board.attributes[:id]

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

            opts.on("-c", "--closed", "Include closed board." ) do |o|
              @options[:closed] = o
            end
          end
        end

        def help
          puts option_parser.help
        end

      end
    end
  end
end
