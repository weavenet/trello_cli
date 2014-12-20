module TrelloCli
  module CLI
    class Run
      def run
        target = ARGV.shift
        cmd    = ARGV.shift || 'help'

        case target
        when *targets
          target_object = CLI::Commands.const_get(target.capitalize).new

          cmd = 'help' unless target_object.actions.include?(cmd.to_sym)

          begin
            target_object.send cmd
          rescue OptionParser::InvalidOption, Trello::Error => e
            puts e.message
            exit 1
          rescue TrelloCli::Errors => e
            puts "error: #{e}"
            exit 1
          rescue NoMethodError => e
            if e.message.match /SocketError/
              puts 'Please connect to the internet to access Trello'
              exit 1
            else
              raise e
            end
          end
        when '-v'
          puts TrelloCli::VERSION
        else
          puts "Unkown target: '#{target}'." unless target == '-h'
          puts "trello [#{targets.join('|')}] [command] OPTIONS"
          puts "Append -h for help on specific target."
        end
      end

      private

      def targets
        klasses = TrelloCli::CLI.constants.reject do |c|
          ( c == :Run ) || ( c == :Commands )
        end
        klasses.map { |k| k.to_s.downcase }
      end

    end
  end
end
