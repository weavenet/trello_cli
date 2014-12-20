module TrelloCli
  module CLI
    module Board
      class List

        def initialize
          @options = {}
        end

        def run
          option_parser.parse!

          data = list_boards(@options[:closed]).map do |b|
            { name: b.attributes[:name],
              id:   b.attributes[:id] }
          end

          puts TrelloCli::Formatters::BoardList.new(data).output @options[:output_format]
        end

        private

        def list_boards(include_closed)
          lb = TrelloCli::Requests::ListBoards.new

          lb.list.select do |b|
            closed = b.attributes[:closed]
            !closed || (closed && include_closed)
          end
        end

        def option_parser(options=@options)
          OptionParser.new do |opts|
            opts.banner = "Usage: trello board [list]"

            opts.on("-c", "--closed", "Include closed board." ) do |o|
              @options[:closed] = o
            end

            opts.on("-o", "--output-format [OUTPUT_FORMAT]", "Output format [json|tsv|legacy]." ) do |o|
              @options[:output_format] = o
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
