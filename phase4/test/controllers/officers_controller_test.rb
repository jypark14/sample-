require "test_helper"

class OfficersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @officer = FactoryBot.create(:officer)
  end

  test "should get index" do
    get officers_path
    assert_response :success
    assert_not_nil assigns(:active_officers)
    assert_not_nil assigns(:inactive_officers)
  end

  test "should get new" do
    get new_officer_path
    assert_response :success
  end

  test "should create officer" do
    assert_difference('Officer.count') do
      post officers_path, params: { officer: { active: @officer.active, ssn: "032-03-5600", rank: "Detective Sergeant", first_name: "Eric", last_name: @officer.last_name, unit_id: @officer.unit_id } }
    end
    assert_equal "Successfully created Eric Blake.", flash[:notice]
    assert_redirected_to officer_path(Officer.last)

    post officers_path, params: { officer: { active: @officer.active, ssn: @officer.ssn, rank: "Detective Sergeant", first_name: nil, last_name: @officer.last_name, unit_id: @officer.unit_id } }
    assert_template :new
  end

  test "should show officer" do
    get officer_path(@officer)
    assert_response :success
    assert_not_nil assigns(:current_assignments)
    assert_not_nil assigns(:past_assignments)
  end

  test "should get edit" do
    get edit_officer_path(@officer)
    assert_response :success
  end

  test "should update officer" do
    patch officer_path(@officer), params: { officer: { active: @officer.active, ssn: @officer.ssn, rank: @officer.rank, first_name: "Alexander", last_name: @officer.last_name, unit_id: @officer.unit_id } }
    assert_redirected_to officer_path(@officer)

    patch officer_path(@officer), params: { officer: { active: @officer.active, ssn: @officer.ssn, rank: @officer.rank, first_name: nil, last_name: @officer.last_name, unit_id: @officer.unit_id } }
    assert_template :edit
  end

end
