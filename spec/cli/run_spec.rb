require 'spec_helper'

describe RubyTrelloCli::CLI::Run do
  it "should call the given command with sub command" do
    ARGV.should_receive(:shift).and_return('card')
    ARGV.should_receive(:shift).and_return('create')

    card_mock = mock 'card'
    RubyTrelloCli::CLI::Card.stub :new => card_mock
    card_mock.should_receive(:create)
    cli = RubyTrelloCli::CLI::Run.new
    cli.run
  end
end
