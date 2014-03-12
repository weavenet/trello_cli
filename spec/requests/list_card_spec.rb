require 'spec_helper'

describe TrelloCli::Requests::ListCards do
  before do
    Trello.should_receive(:configure)
  end

  it "should create the requested card" do
    args = { :board_id    => '123',
             :list_id     => '321' }
    options = { 'idBoard' => args[:board_id],
                'id'      => args[:list_id] }
    trello_list_mock = double 'trello list'
    Trello::List.should_receive(:new).
                 with(options).
                 and_return trello_list_mock
    trello_list_mock.should_receive(:cards)
    subject.list args
  end
end
