require 'spec_helper'

describe TrelloCli::Requests::MoveCard do
  before do
    Trello.should_receive(:configure)
  end

  it "should move the card to the requested list" do
    args = { card_id: '123', list_id: '321' }
    trello_card_mock = double 'trello card'
    trello_list_mock = double 'trello list'
    Trello::Card.should_receive(:new).
                 with('id' => args[:card_id]).
                 and_return trello_card_mock
    Trello::List.should_receive(:find).
                 with(args[:list_id]).
                 and_return trello_list_mock
    trello_card_mock.should_receive(:move_to_list).with(trello_list_mock)
    subject.move args
  end
end
