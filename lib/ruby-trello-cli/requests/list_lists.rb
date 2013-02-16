module RubyTrelloCli
  module Requests
    class ListLists

      include Shared

      def initialize
        connect_to_trello
      end

      def list(args)
        board_id = args[:board_id]

        lists = board(board_id).lists

        lists.each do |list|
          name = list.attributes[:name]
          id   = list.attributes[:id]

          puts "Name : #{name} ( #{id} )"
        end
      end

      private

      def board(board_id)
        Trello::Board.new 'id' => board_id
      end

    end
  end
end
