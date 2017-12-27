require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @food = foods(:one)
  end

  test "should get index" do
    get foods_url
    assert_response :success
  end

  test "should get new" do
    get new_food_url
    assert_response :success
  end

  test "should create food" do
    assert_difference('Food.count') do
      post foods_url, params: { food: { food_truck_id: @food.food_truck_id, name: @food.name, price: @food.price, comments: @food.comments, type: @food.type } }
    end

    assert_redirected_to food_path(Food.last)
  end

  test "should show food" do
    get food_url(@food)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_url(@food)
    assert_response :success
  end

  test "should update food" do
    patch food_url(@food), params: { id: @food, food: { food_truck_id: @food.food_truck_id, name: @food.name, price: @food.price, comments: @food.comments, type: @food.type } }
    assert_redirected_to food_path(@food)
  end

  test "should destroy food" do
    assert_difference('Food.count', -1) do
      delete food_url(@food)
    end

    assert_redirected_to foods_path
  end
end
