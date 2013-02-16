module RubyTrelloCli
  module CLI
    class Run
      def run
        target = ARGV.shift
        cmd    = ARGV.shift.to_sym

        case target
        when 'card'
          card = CLI::Card.new
          card.send cmd if card.local_methods.include? cmd
        when 'list'
          list = CLI::List.new
          list.send cmd if list.local_methods.include? cmd
        when '-v'
          puts RubyTrelloCli::VERSION
        else
          puts "Unkown target: '#{target}'." unless target == '-h'
          puts "trello [#{targets.join('|')}] [command] OPTIONS"
          puts "Append -h for help on specific target."
        end
      end

      private

      def targets
        klasses = RubyTrelloCli::CLI.constants.reject { |c| c == :Run }
        klasses.map { |k| k.to_s.downcase }
      end

    end
  end
end
