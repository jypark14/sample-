class InvestigationsHelperTest < ActionView::TestCase
  setup do
    @crime = FactoryBot.create(:crime)
    @investigation = FactoryBot.create(:investigation, crime: @crime, date_opened: 2.days.ago.to_date)
  end

  test "should get correct date_opened" do
    assert_equal 2.days.ago.to_date.strftime("%m/%d/%y"), display_date(@investigation, "open")
  end

  test "should get correct date_closed" do
    @investigation.date_closed = Date.current
    assert_equal Date.current.strftime("%m/%d/%y"), display_date(@investigation, "closed")
  end
end