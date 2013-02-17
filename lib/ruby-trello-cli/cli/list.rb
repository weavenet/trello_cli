module RubyTrelloCli
  module CLI
    class List

      include Shared

      def initialize
        @options = {}
      end

      def list
        list_lists.each do |list|
          name = list.attributes[:name]
          id   = list.attributes[:id]

          puts "#{name} ( #{id} )"
        end
      end

      private

      def list_lists
        ll = RubyTrelloCli::Requests::ListLists.new
        ll.list @options
      end

      def option_parser(options=@options)
        OptionParser.new do |opts|

          opts.banner = "Usage: ruby-trello-cli list [list] [options]"

          opts.on("-b", "--board [BOARD]", "Trello Board Id") do |b|
            options[:board_id] = b
          end

        end
      end

    end
  end
end
