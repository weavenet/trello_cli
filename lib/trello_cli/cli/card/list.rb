module TrelloCli
  module CLI
    module Card
      class List

        def initialize
          @options = {}
        end

        def run
          option_parser.parse!

          puts list_cards
        end

        private

        def list_cards
          TrelloCli::Requests::ListCards.new.list @options
        end

        def option_parser
          OptionParser.new do |opts|
            opts.banner = "Usage: trello card [create] [options]"

            opts.on("-b", "--board [BOARD]", "Trello Board Id") do |b|
              @options[:board_id] = b
            end

            opts.on("-l", "--list [LIST]", "List To Query") do |l|
              @options[:list_id] = l
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
