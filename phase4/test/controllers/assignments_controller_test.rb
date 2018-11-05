require "test_helper"


class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crime = FactoryBot.create(:crime)
    @officer = FactoryBot.create(:officer)
    @investigation = FactoryBot.create(:investigation, crime: @crime)
  end

  teardown do
    Investigation.delete_all
    Crime.delete_all
    Officer.delete_all
  end

  test "should get new" do
    get new_assignment_path(officer_id: @officer.id)
    assert_response :success
    assert_not_nil assigns(:officer)
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post assignments_path, params: { assignment: { officer_id: @officer.id, investigation_id: @investigation.id, start_date: Date.current, end_date: nil } }
    end
    assert_equal "Successfully added assignment.", flash[:notice]
    assert_redirected_to officer_path(Assignment.last.officer)

    post assignments_path, params: { assignment: { officer_id: @officer.id, investigation_id: nil, start_date: Date.current, end_date: nil } }
    assert_template :new, locals: { officer: @officer }
  end

  test "should terminate assignment" do
    @assignment = FactoryBot.create(:assignment, officer: @officer, investigation: @investigation)
    assert_equal 1, @officer.assignments.current.count
    patch terminate_assignment_path(@assignment)
    @officer.reload
    assert_equal 0, @officer.assignments.current.count
    assert_redirected_to officer_path(@assignment.officer)
    assert_equal "Successfully terminated assignment.", flash[:notice]
  end

end

