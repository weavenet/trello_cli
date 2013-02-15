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
    create_card_mock = mock 'create card'
    RubyTrelloCli::Requests::CreateCard.stub :new => create_card_mock
    create_card_mock.should_receive(:create).with(args).
                 and_return trello_card_mock
    card.create
  end
end
