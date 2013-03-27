require 'spec_helper'

TrelloCli::CLI::Commands::Test = Struct.new('Test')

describe TrelloCli::CLI::Commands::Shared do

  before do
    @object = TrelloCli::CLI::Commands::Test.new
    @object.extend TrelloCli::CLI::Commands::Shared
    @object.define_singleton_method(:test_action) { true }
  end

  it "should return a list of actions (instance methods)" do
    @object.actions.should == [:test_action]
  end

  it "should return the short name of the target class" do
    @object.target_name.should == 'test'
  end

  it "should return the shared methods" do
    @object.shared_methods.should == TrelloCli::CLI::Commands::Shared.instance_methods
  end

  it "should print help for a given target" do
    @object.should_receive(:puts).with('Valid commands for test: test_action')
    @object.should_receive(:puts).with('For further help, append -h to sub command.')
    @object.help
  end

end
