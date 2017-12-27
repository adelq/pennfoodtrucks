require 'test_helper'

class VisitsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @visit = visits(:one)
  end

  test "should get index" do
    get visits_url
    assert_response :success
  end

  test "should get new" do
    get new_visit_url
    assert_response :success
  end

  test "should create visit" do
    assert_difference('Visit.count') do
      post visits_url, params: { visit: { food_truck_id: @visit.food_truck_id, ip: @visit.ip, public: @visit.public, timestamp: @visit.timestamp } }
    end

    assert_redirected_to visit_path(Visit.last)
  end

  test "should show visit" do
    get visit_url(@visit)
    assert_response :success
  end

  test "should get edit" do
    get edit_visit_url(@visit)
    assert_response :success
  end

  test "should update visit" do
    patch visit_url(@visit), params: { id: @visit, visit: { food_truck_id: @visit.food_truck_id, ip: @visit.ip, public: @visit.public, timestamp: @visit.timestamp } }
    assert_redirected_to visit_path(@visit)
  end

  test "should destroy visit" do
    assert_difference('Visit.count', -1) do
      delete visit_url(@visit)
    end

    assert_redirected_to visits_path
  end
end
