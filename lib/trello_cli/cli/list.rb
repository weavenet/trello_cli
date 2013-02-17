module TrelloCli
  module CLI
    class List

      include Shared

      def initialize
        @options = {}
      end

      def list
        parse_options

        list_lists.each do |list|
          name = list.attributes[:name]
          id   = list.attributes[:id]

          puts "#{name} ( #{id} )"
        end
      end

      private

      def list_lists
        ll = TrelloCli::Requests::ListLists.new
        ll.list @options
      end

      def option_parser
        OptionParser.new do |opts|

          opts.banner = "Usage: trello list [list] [options]"

          opts.on("-b", "--board [BOARD]", "Trello Board Id") do |b|
            @options[:board_id] = b
          end

        end
      end

    end
  end
end
