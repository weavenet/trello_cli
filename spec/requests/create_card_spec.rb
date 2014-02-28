require 'spec_helper'

describe TrelloCli::Requests::CreateCard do
  before do
    Trello.should_receive(:configure)
  end

  it "should create the requested card" do
    args = { :name        => 'name',
             :description => 'desc',
             :board_id    => '123',
             :list_id     => '321' }
    options = { 'name'    => args[:name],
                'desc'    => args[:description],
                'idBoard' => args[:board_id],
                'idList'  => args[:list_id] }
    trello_card_mock = double 'trello card'
    Trello::Card.should_receive(:new).
                 with(options).
                 and_return trello_card_mock
    trello_card_mock.should_receive(:save)
    create_card = TrelloCli::Requests::CreateCard.new
    create_card.create args
  end
end
