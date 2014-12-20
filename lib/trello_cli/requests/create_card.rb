module TrelloCli
  module Requests
    class CreateCard

      include Shared

      def initialize
        connect_to_trello
      end

      def create(args)
        @board_id = args[:board_id]

        args[:members].each do |member_username|
          unless members.member_exists_in_board? member_username
            msg = "member '#{member_username}' does not exist in board '#{@board_id}'."
            raise Errors.new msg
          end
        end

        member_ids = args[:members].map do |member_username|
          m = members.find_member_by_username_in_board member_username
          m.attributes[:id]
        end

        card = Trello::Card.new 'name'      => args[:name],
                                'desc'      => args[:desc],
                                'idBoard'   => @board_id,
                                'idList'    => args[:list_id],
                                'idMembers' => member_ids.join(",")
        card.save

        card
      end

      private

      def members
        @members ||= Members.new @board_id
      end

    end
  end
end
