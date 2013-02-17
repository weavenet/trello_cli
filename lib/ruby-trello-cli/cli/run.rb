module RubyTrelloCli
  module CLI
    class Run
      def run
        target = ARGV.shift
        cmd    = ARGV.shift.to_sym

        case target
        when 'create', 'list'
          target_object = CLI.const_get(target.capitalize).new
          target_object.send cmd if target_object.actions.include? cmd
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
        klasses = RubyTrelloCli::CLI.constants.reject do |c| 
          ( c == :Run ) || ( c == :Shared )
        end
        klasses.map { |k| k.to_s.downcase }
      end

    end
  end
end
