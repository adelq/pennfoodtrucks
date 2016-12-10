require 'test_helper'

class FoodTrucksControllerTest < ActionController::TestCase
  setup do
    @food_truck = food_trucks(:ft)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_trucks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_truck" do
    assert_difference('FoodTruck.count') do
      post :create, food_truck: { MF_close: @food_truck.MF_close, MF_open: @food_truck.MF_open, Sa_close: @food_truck.Sa_close, Sa_open: @food_truck.Sa_open, Su_close: @food_truck.Su_close, Su_open: @food_truck.Su_open, blurb: @food_truck.blurb, cleanURL: @food_truck.cleanURL, genreBig: @food_truck.genreBig, genreSmall1: @food_truck.genreSmall1, genreSmall2: @food_truck.genreSmall2, intersection: @food_truck.intersection, lat: @food_truck.lat, location: @food_truck.location, long: @food_truck.long, name: @food_truck.name, phone: @food_truck.phone, rating: @food_truck.rating }
    end

    assert_redirected_to food_truck_path(assigns(:food_truck))
  end

  test "should show food_truck" do
    get :show, id: @food_truck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_truck
    assert_response :success
  end

  test "should update food_truck" do
    patch :update, id: @food_truck, food_truck: { MF_close: @food_truck.MF_close, MF_open: @food_truck.MF_open, Sa_close: @food_truck.Sa_close, Sa_open: @food_truck.Sa_open, Su_close: @food_truck.Su_close, Su_open: @food_truck.Su_open, blurb: @food_truck.blurb, cleanURL: @food_truck.cleanURL, genreBig: @food_truck.genreBig, genreSmall1: @food_truck.genreSmall1, genreSmall2: @food_truck.genreSmall2, intersection: @food_truck.intersection, lat: @food_truck.lat, location: @food_truck.location, long: @food_truck.long, name: @food_truck.name, phone: @food_truck.phone, rating: @food_truck.rating }
    assert_redirected_to food_truck_path(assigns(:food_truck))
  end

  test "should destroy food_truck" do
    assert_difference('FoodTruck.count', -1) do
      delete :destroy, id: @food_truck
    end

    assert_redirected_to food_trucks_path
  end
end
