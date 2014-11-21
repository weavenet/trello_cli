module TrelloCli
  module CLI
    module Board
      class List

        def initialize
          @options = {}
        end

        def run
          option_parser.parse!

          list_boards(@options[:closed]).each do |board|
            name   = board.attributes[:name]
            id     = board.attributes[:id]
            closed = board.attributes[:closed]
            puts "#{name} ( #{id} )"
          end
        end

        private

        def list_boards(include_closed)
          lb = TrelloCli::Requests::ListBoards.new

          lb.list.select do |b|
            closed = b.attributes[:closed]
            !closed || (closed && include_closed)
          end
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
