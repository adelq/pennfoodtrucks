require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, review: { bang: @review.bang, comment: @review.comment, date: @review.date, display_rev: @review.display_rev, email: @review.email, food_truck_id: @review.food_truck_id, friendliness: @review.friendliness, overall: @review.overall, owner: @review.owner, owner_ip: @review.owner_ip, quality: @review.quality, quantity: @review.quantity, speed: @review.speed, staff: @review.staff, title: @review.title }
    end

    assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { bang: @review.bang, comment: @review.comment, date: @review.date, display_rev: @review.display_rev, email: @review.email, food_truck_id: @review.food_truck_id, friendliness: @review.friendliness, overall: @review.overall, owner: @review.owner, owner_ip: @review.owner_ip, quality: @review.quality, quantity: @review.quantity, speed: @review.speed, staff: @review.staff, title: @review.title }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
