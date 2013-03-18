require 'spec_helper'

describe TrelloCli::CLI::Run do

  before do
    @card_mock = mock 'card'
    TrelloCli::CLI::Commands::Card.stub :new => @card_mock
  end

  it "should call the given target with sub command" do
    ARGV.should_receive(:shift).and_return('card')
    ARGV.should_receive(:shift).and_return('create')

    @card_mock.stub :actions => [:create]
    @card_mock.should_receive(:create)
    cli = TrelloCli::CLI::Run.new
    cli.run
  end

  it "should call help if the command does not exist" do
    ARGV.should_receive(:shift).and_return('card')
    ARGV.should_receive(:shift).and_return('bad_cmd')

    @card_mock.stub :actions => [:create]
    @card_mock.should_receive(:help)
    cli = TrelloCli::CLI::Run.new
    cli.run
  end

  it "should display help if the target does not exist" do
    ARGV.should_receive(:shift).and_return('bad_target')
    ARGV.should_receive(:shift).and_return('create')

    cli = TrelloCli::CLI::Run.new
    cli.should_receive(:puts).with "Unkown target: 'bad_target'."
    cli.should_receive(:puts).with "trello [board|card|list] [command] OPTIONS"
    cli.should_receive(:puts).with "Append -h for help on specific target."
    cli.run
  end

end
