module TrelloCli
  module Requests
    class Members

      include Shared

      def initialize(board_id)
        connect_to_trello

        @board_id = board_id
      end

      def member_exists_in_board?(member_username)
        !!find_member_by_username_in_board(member_username)
      end

      def find_member_by_username_in_board(member_username)
        members.each do |m|
          return m if m.attributes[:username] == member_username
        end

        false
      end

      private

      def member_id?(name)
        Trello::Member.find(name)
      end

      def members
        @members ||= board.members
      end

      def board
        @board ||= Trello::Board.find @board_id
      end

    end
  end
end
