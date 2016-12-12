class FoodTruck < ActiveRecord::Base
  has_many :reviews

  validates :lat, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :long, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

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

  def genres
    [genreBig, genreSmall1, genreSmall2].reject { |genre| genre == 'NULL' }.join(', ')
  end
end
