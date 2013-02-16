module RubyTrelloCli
  module CLI
    class Run
      def run
        target = ARGV.shift
        cmd    = ARGV.shift

        case target
        when 'card'
          CLI::Card.new.send cmd
        when 'list'
          CLI::List.new.send cmd
        when '-v'
          puts RubyTrelloCli::VERSION
        else
          puts "Unkown target: '#{target}'." unless target == '-h'
          puts "trello [card|list] [command] OPTIONS"
          puts "Append -h for help on specific command."
        end

      end
    end
  end
end
