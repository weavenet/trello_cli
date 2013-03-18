module TrelloCli
  module Requests
    class ListCards

      include Shared

      def initialize
        connect_to_trello
      end

      def list(args)
        list = Trello::List.new 'idBoard' => args[:board_id],
                                'id'      => args[:list_id]
        list.cards
      end

    end
  end
end
