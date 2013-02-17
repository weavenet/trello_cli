module TrelloCli
  module CLI
    class Card

      include Shared

      def initialize
        @options = {}
      end

      def create
        parse_options

        card        = create_card
        name        = card.attributes[:name]
        description = card.attributes[:description]

        puts "Card Created."
        puts "Name        : #{name}"
        puts "Description : #{description}"
      end

      private

      def create_card
        cc = TrelloCli::Requests::CreateCard.new
        cc.create @options
      end

      def option_parser
        OptionParser.new do |opts|
          opts.banner = "Usage: trello card [create] [options]"

          opts.on("-b", "--board [BOARD]", "Trello Board Id") do |b|
            @options[:board_id] = b
          end

          opts.on("-d", "--description [DESCRIPTION]", "Description Of Card") do |d|
            @options[:description] = d
          end

          opts.on("-l", "--list [LIST]", "List Of Card") do |l|
            @options[:list_id] = l
          end

          opts.on("-n", "--name [NAME]", "Name Of Card") do |n|
            @options[:name] = n
          end
        end
      end
        

    end
  end
end
