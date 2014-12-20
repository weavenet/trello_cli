require 'spec_helper'

describe TrelloCli::Formatters::Base do
  let(:data) { ( { data: "test1234" } ) }
  let(:subject) { TrelloCli::Formatters::Base.new data }
  it "should create a formater and output the data as JSON" do
    subject.output("json").should == data.to_json
  end
end

