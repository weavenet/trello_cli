module TrelloCli
  module CLI
    module Card
      class List

        def initialize
          @options = {}
        end

        def run
          option_parser.parse!

          list_cards.each do |card|
            puts "| ID: #{card.id}"
            puts "| Name: #{card.name}"
            puts "| Description: #{card.name}"
            puts "|------------------------"
          end
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
