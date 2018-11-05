require "test_helper"

describe Suspect do
  let(:suspect) { Suspect.new }

  it "must be valid" do
    value(suspect).must_be :valid?
  end
end
