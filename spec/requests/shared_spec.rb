require 'spec_helper'

describe RubyTrelloCli::Requests::Shared do

  before do
    @object = Object.new
    @object.extend RubyTrelloCli::Requests::Shared
  end

  it "should connect to trello" do
    trello_configure_mock = mock 'trello_configure'
    Trello.should_receive(:configure).and_yield trello_configure_mock
    trello_configure_mock.should_receive(:developer_public_key=).
                          with('key')
    trello_configure_mock.should_receive(:member_token=).
                          with('token')
    @object.stub :key => 'key', :token => 'token'
    @object.connect_to_trello
  end

end
