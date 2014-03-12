module TrelloCli
  module CLI
    module Card
      class Move

        def initialize
          @options = {}
        end

        def run
          option_parser.parse!

          move_card

          puts "Card moved to #{list_id}."
        end

        private

        def move_card
          mc = TrelloCli::Requests::MoveCard.new
          mc.move @options
        end

        def option_parser
          OptionParser.new do |opts|
            opts.banner = "Usage: trello card [move] [options]"

            opts.on("-c", "--card_id [CARD_ID]", "ID of Card") do |c|
              @options[:card_id] = c
            end

            opts.on("-l", "--list_id [LIST_ID]", "New List ID") do |l|
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
