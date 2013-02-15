require 'ruby-trello-cli/cli/card'

module RubyTrelloCli
  module CLI
    class Run
      def run
        cmd    = ARGV.shift
        subcmd = ARGV.shift

        case cmd
        when 'card'
          CLI::Card.send subcmd
        end
      end
    end
  end
end
