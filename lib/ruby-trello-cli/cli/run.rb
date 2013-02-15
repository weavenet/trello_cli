require 'ruby-trello-cli/cli/card'

module RubyTrelloCli
  module CLI
    class Run
      def run
        cmd    = ARGV.shift
        subcmd = ARGV.shift.to_sym

        case cmd
        when 'card'
          CLI::Card.new.send subcmd
        when 'list'
          CLI::List.new.send subcmd
        end
      end
    end
  end
end
