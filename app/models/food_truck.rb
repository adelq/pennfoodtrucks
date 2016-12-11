class FoodTruck < ActiveRecord::Base
  def open?
    dow = dow_to_initials(Time.now.wday)
    open = self["#{dow}_open"]
    close = self["#{dow}_close"]
    return false if open.nil?
    open.to_f * 60 * 60 < Time.now.seconds_since_midnight < close.to_f * 60 * 60
  end

  def dow_to_initials(dow)
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
