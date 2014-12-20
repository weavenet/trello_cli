module TrelloCli
  module CLI
    module Card
      class List

        def initialize
          @options = {}
        end

        def run
          option_parser.parse!

          data = list_cards.map do |c|
            { name: c.name, id: c.id, desc: c.desc }
          end

          puts TrelloCli::Formatters::CardList.new(data).output(@options[:output])
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

            opts.on("-o", "--output [OUTPUT]", "Output format [json|tsv|legacy]." ) do |o|
              @options[:output] = o
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
