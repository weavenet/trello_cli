module TrelloCli
  module Requests
    class CreateCard

      include Shared

      def initialize
        connect_to_trello
      end

      def create(args)
        card = Trello::Card.new 'name'    => args[:name],
                                'desc'    => args[:description],
                                'idBoard' => args[:board_id],
                                'idList'  => args[:list_id]
        card.save
      end

    end
  end
end
