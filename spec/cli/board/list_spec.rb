require 'spec_helper'

describe TrelloCli::CLI::Board::List do
  board = Struct.new :attributes
  let!(:board1) { (board.new({ name: "board1", id: "1", closed: true })) }
  let!(:board2) { (board.new({ name: "board2", id: "2", closed: false })) }

  let(:trello_mock) { double "trello" }
  let(:options_mock) { double "trello" }

  before do
    allow(OptionParser).to receive(:new).and_return options_mock
    expect(options_mock).to receive(:parse!)
    allow(TrelloCli::Requests::ListBoards).to receive(:new).and_return trello_mock
    allow(trello_mock).to receive(:list).and_return [board1, board2]
  end

  it "should puts open boards" do
    expect(subject).to receive(:puts).with("board2 ( 2 )")
    subject.run
  end

  it "should puts all boards" do
    subject.instance_variable_set(:@options, { closed: true })
    expect(subject).to receive(:puts).with("board1 ( 1 )")
    expect(subject).to receive(:puts).with("board2 ( 2 )")
    subject.run
  end

end
