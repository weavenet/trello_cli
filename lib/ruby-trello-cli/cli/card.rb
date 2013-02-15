module RubyTrelloCli
  module CLI
    class Card

      include Shared

      def initialize
        parse_options
        connect_to_trello
      end

      def create
        puts create_card 
      end

      private

      def create_card
        card = Trello::Board.new 'name'        => @options[:name],
                                 'description' => @options[:description],
                                 'idBoard'     => @options[:board_id],
                                 'idList'      => @options[:list_id]
        card.save
      end

      def board_id
        @options[:board_id]
      end

      def parse_options
        @options = {}

        OptionParser.new do |opts|

          opts.banner = "Usage: ruby-trello-cli card [create] [options]"

          opts.on("-b", "--board [BOARD]", "Trello Board Id") do |b|
            @options[:board_id] = b
          end

          opts.on("-d", "--description [DESCRIPTION]", "Description Of Card") do |d|
            @options[:description] = d
          end

          opts.on("-l", "--list [LIST]", "List Of Card") do |l|
            @options[:list] = l
          end

          opts.on("-n", "--name [NAME]", "Name Of Card") do |n|
            @options[:name] = n
          end

        end.parse!
      end

    end
  end
end
