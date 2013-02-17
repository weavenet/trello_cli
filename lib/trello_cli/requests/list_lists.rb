module TrelloCli
  module Requests
    class ListLists

      include Shared

      def initialize
        connect_to_trello
      end

      def list(args)
        board_id = args[:board_id]
        board(board_id).lists
      end

      private

      def board(board_id)
        Trello::Board.new 'id' => board_id
      end

    end
  end
end
