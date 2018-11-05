require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  # Relationship matchers
  should have_many(:officers)

  # Validation matchers
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive

  # Context
  context "Within context" do
    setup do
      create_units
    end
    
    teardown do
      destroy_units
    end

    should "have active and inactive scopes" do
      assert_equal 3, Unit.active.count
      assert_equal [@headquarters, @homicide, @major_crimes], Unit.active.to_a.sort_by{|u| u.name}
      assert_equal 1, Unit.inactive.count
      assert_equal [@section_31], Unit.inactive.to_a
    end

    should "have an alphabetical scope for ordering" do
      assert_equal [@headquarters, @homicide, @major_crimes, @section_31], Unit.alphabetical.to_a
    end

    should "be able to calculate the number of active officers in the unit" do
      create_officers
      assert_equal 3, @major_crimes.number_of_active_officers
      # doesn't get Loeb in HQ, who is inactive...
      assert_equal 1, @headquarters.number_of_active_officers
      destroy_officers
    end
  end
end
