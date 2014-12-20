module TrelloCli
  module CLI
    module List
      class List

        def initialize
          @options = {}
        end

        def run
          option_parser.parse!

          data = list_lists.map do |l|
            {
              id:   l.attributes[:id],
              name: l.attributes[:name]
            }
          end

          puts TrelloCli::Formatters::ListList.new(data).output @options[:output]
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

            opts.on("-o", "--output [OUTPUT]", "Output format [json|tsv|legacy]." ) do |o|
              @options[:output] = o
            end
          end
        end

        def help
          puts option_parser.help
        end

      end
    end
  end
end
