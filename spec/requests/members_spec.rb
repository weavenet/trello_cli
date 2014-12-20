require 'spec_helper'

describe TrelloCli::Requests::Members do
  before do
    Trello.should_receive(:configure)
  end

  let(:subject) { TrelloCli::Requests::Members.new "123" }
  let(:board_mock) { double "board" }
  let(:member_object) { Struct.new(:attributes) }
  let(:member1) { member_object.new(username: "member1") }
  let(:member2) { member_object.new(username: "member2") }
  let(:members) { [member1, member2] }
 
  before do
    Trello::Board.should_receive(:find).with("123").and_return board_mock
    board_mock.should_receive(:members).and_return members
  end

  describe "#member_exists_in_board?" do
    it "should return true if the member exists" do
      subject.member_exists_in_board?("member1").should == true
    end
    it "should return false if the member does not exists" do
      subject.member_exists_in_board?("member999").should == false
    end
  end

  describe "#find_member_by_username_in_board" do
    it "should return the member object for a given username" do
      subject.find_member_by_username_in_board("member1").should == member1
    end
  end

end
