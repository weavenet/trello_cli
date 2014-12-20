module TrelloCli
  module CLI
    module Card
      class Create

        def initialize
          @options = { members: [] }
        end

        def run
          option_parser.parse!

          card = create_card
          data = { id:   card.attributes[:id],
                   name: card.attributes[:name],
                   desc: card.attributes[:desc] }

          puts TrelloCli::Formatters::CardCreate.new(data).output @options[:output]
        end

        private

        def create_card
          cc = TrelloCli::Requests::CreateCard.new
          cc.create @options
        end

        def option_parser
          OptionParser.new do |opts|
            opts.banner = "Usage: trello card [create] [options]"

            opts.on("-b", "--board [BOARD]", "Trello Board Id") do |b|
              @options[:board_id] = b
            end

            opts.on("-d", "--description [DESCRIPTION]", "Description Of Card") do |d|
              @options[:desc] = d
            end

            opts.on("-l", "--list [LIST]", "List Of Card") do |l|
              @options[:list_id] = l
            end

            opts.on("-m", "--member [MEMBER_NAME]", "Member name to assign to card") do |m|
              @options[:members] << m
            end

            opts.on("-n", "--name [NAME]", "Name Of Card") do |n|
              @options[:name] = n
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
