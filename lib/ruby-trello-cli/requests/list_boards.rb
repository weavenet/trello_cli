module RubyTrelloCli
  module Requests
    class ListBoards

      include Shared

      def initialize
        connect_to_trello
      end

      def list
        Trello::Board.all
      end

    end
  end
end
