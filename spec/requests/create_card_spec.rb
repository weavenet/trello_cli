require 'spec_helper'

describe TrelloCli::Requests::CreateCard do
  before do
    Trello.should_receive(:configure)
  end

  let(:members_mock) { double "members" }
  let(:trello_card_mock) { double 'trello card' }
  let(:member_struct) { Struct.new(:attributes) }

  before do
    @args = { :name      => 'name',
              :desc      => 'desc',
              :board_id  => '123',
              :list_id   => '321',
              :members   => ["user1", "user2"] }
    @options = { 'name'      => @args[:name],
                 'desc'      => @args[:desc],
                 'idBoard'   => @args[:board_id],
                 'idList'    => @args[:list_id],
                 'idMembers' => "id1,id2" }
  end

  it "should create the requested card" do
    TrelloCli::Requests::Members.should_receive(:new).
                                 with("123").
                                 and_return members_mock
    @args[:members].each do |m|
      members_mock.should_receive(:member_exists_in_board?).with(m).and_return true
    end
    members_mock.should_receive(:find_member_by_username_in_board).
                 with("user1").and_return member_struct.new(id: "id1")
    members_mock.should_receive(:find_member_by_username_in_board).
                 with("user2").and_return member_struct.new(id: "id2")

    Trello::Card.should_receive(:new).
                 with(@options).
                 and_return trello_card_mock
    trello_card_mock.should_receive(:save)
    subject.create @args
  end
end
