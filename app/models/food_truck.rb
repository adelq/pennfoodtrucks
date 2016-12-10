class FoodTruck < ActiveRecord::Base
  def self.dow_to_initials(dow)
    # Convert an integer day of week to attribute name
    # 0 => Su, 1-5 => MF, 6 => Sa
    case dow
    when 0
      'Su'
    when 1..5
      'MF'
    when 6
      'Sa'
    end
  end
end
