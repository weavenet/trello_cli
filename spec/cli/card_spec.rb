require 'spec_helper'

describe RubyTrelloCli::CLI::Card do
  it "should call the given command with sub command" do
    card = RubyTrelloCli::CLI::Card.new
    trello_card_mock = mock 'trello card'
    options = { }
    args = { 'name'    => options[:name],
             'desc'    => options[:description],
             'idBoard' => options[:board_id],
             'idList'  => options[:list_id] }
    Trello::Card.should_receive(:new).with(args).
                 and_return trello_card_mock
    card.should_receive(:connect_to_trello)
    card.create
  end
end
