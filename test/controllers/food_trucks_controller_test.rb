require 'test_helper'

class FoodTrucksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @food_truck = food_trucks(:ft)
  end

  test "should get index" do
    get food_trucks_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:bob)
    get new_food_truck_url
    assert_response :success
  end

  test "should create food_truck" do
    sign_in users(:bob)
    assert_difference('FoodTruck.count') do
      post food_trucks_url, params: { food_truck: { MF_close: @food_truck.MF_close, MF_open: @food_truck.MF_open, Sa_close: @food_truck.Sa_close, Sa_open: @food_truck.Sa_open, Su_close: @food_truck.Su_close, Su_open: @food_truck.Su_open, blurb: @food_truck.blurb, cleanURL: @food_truck.cleanURL, genreBig: @food_truck.genreBig, genreSmall1: @food_truck.genreSmall1, genreSmall2: @food_truck.genreSmall2, intersection: @food_truck.intersection, lat: @food_truck.lat, location: @food_truck.location, long: @food_truck.long, name: @food_truck.name, phone: @food_truck.phone, rating: @food_truck.rating } }
    end

    assert_redirected_to food_truck_path(FoodTruck.last)
  end

  test "should show food_truck" do
    get food_truck_url(@food_truck)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:adel)
    get edit_food_truck_url(@food_truck)
    assert_response :success
  end

  test "should update food_truck" do
    sign_in users(:adel)
    patch food_truck_url(@food_truck), params: { id: @food_truck, food_truck: { MF_close: @food_truck.MF_close, MF_open: @food_truck.MF_open, Sa_close: @food_truck.Sa_close, Sa_open: @food_truck.Sa_open, Su_close: @food_truck.Su_close, Su_open: @food_truck.Su_open, blurb: @food_truck.blurb, cleanURL: @food_truck.cleanURL, genreBig: @food_truck.genreBig, genreSmall1: @food_truck.genreSmall1, genreSmall2: @food_truck.genreSmall2, intersection: @food_truck.intersection, lat: @food_truck.lat, location: @food_truck.location, long: @food_truck.long, name: @food_truck.name, phone: @food_truck.phone, rating: @food_truck.rating } }
    assert_redirected_to food_truck_path(@food_truck)
  end

  test "should destroy food_truck" do
    sign_in users(:adel)
    assert_difference('FoodTruck.count', -1) do
      delete food_truck_url(@food_truck)
    end

    assert_redirected_to food_trucks_path
  end
end
