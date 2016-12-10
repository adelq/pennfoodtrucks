require 'test_helper'

class FoodTruckTest < ActiveSupport::TestCase
  test 'convert weekdays to initials' do
    assert_equal 'Su', FoodTruck.dow_to_initials(0)
    (1..5).each do |dow|
      assert_equal 'MF', FoodTruck.dow_to_initials(dow)
    end
    assert_equal 'Sa', FoodTruck.dow_to_initials(6)
  end
end
