require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_review_url
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post reviews_url, params: { review: { bang: @review.bang, comment: @review.comment, date: @review.date, display_rev: @review.display_rev, email: @review.email, food_truck_id: @review.food_truck_id, friendliness: @review.friendliness, overall: @review.overall, owner: @review.owner, owner_ip: @review.owner_ip, quality: @review.quality, quantity: @review.quantity, speed: @review.speed, staff: @review.staff, title: @review.title } }
    end

    assert_redirected_to review_path(Review.last)
  end

  test "should show review" do
    get review_url(@review)
    assert_response :success
  end

  test "should get edit" do
    get edit_review_url(@review)
    assert_response :success
  end

  test "should update review" do
    patch review_url(@review), params: { id: @review, review: { bang: @review.bang, comment: @review.comment, date: @review.date, display_rev: @review.display_rev, email: @review.email, food_truck_id: @review.food_truck_id, friendliness: @review.friendliness, overall: @review.overall, owner: @review.owner, owner_ip: @review.owner_ip, quality: @review.quality, quantity: @review.quantity, speed: @review.speed, staff: @review.staff, title: @review.title } }
    assert_redirected_to review_path(@review)
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete review_url(@review)
    end

    assert_redirected_to reviews_path
  end
end
