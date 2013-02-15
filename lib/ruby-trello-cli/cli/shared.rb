module RubyTrelloCli
  module CLI
    module Shared

      def connect_to_trello
        Trello.configure do |config|
          config.developer_public_key = key
          config.member_token         = token
        end
      end

      def key
        ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
      end

      def token
        ENV['TRELLO_MEMBER_TOKEN']
      end

    end
  end
end
