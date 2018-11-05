require "test_helper"

describe CrimeInvestigation do
  let(:crime_investigation) { CrimeInvestigation.new }

  it "must be valid" do
    value(crime_investigation).must_be :valid?
  end
end
