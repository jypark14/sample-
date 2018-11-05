require "test_helper"

describe Criminal do
  let(:criminal) { Criminal.new }

  it "must be valid" do
    value(criminal).must_be :valid?
  end
end
