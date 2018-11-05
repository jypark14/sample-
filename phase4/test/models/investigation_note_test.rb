require "test_helper"

describe InvestigationNote do
  let(:investigation_note) { InvestigationNote.new }

  it "must be valid" do
    value(investigation_note).must_be :valid?
  end
end
