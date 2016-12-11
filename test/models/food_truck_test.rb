require 'test_helper'

class FoodTruckTest < ActiveSupport::TestCase
  setup do
    @ft = food_trucks(:ft)
  end

  test 'convert weekdays to initials' do
    assert_equal 'Su', @ft.dow_to_initials(0)
    (1..5).each do |dow|
      assert_equal 'MF', @ft.dow_to_initials(dow)
    end
    assert_equal 'Sa', @ft.dow_to_initials(6)
  end
end
