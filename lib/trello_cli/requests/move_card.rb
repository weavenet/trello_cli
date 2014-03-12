module TrelloCli
  module Requests
    class MoveCard

      include Shared

      def initialize
        connect_to_trello
      end

      def move(args)
        card = Trello::Card.new 'id' => args[:card_id]
        list = Trello::List.find args[:list_id]
        card.move_to_list list
      end

    end
  end
end
