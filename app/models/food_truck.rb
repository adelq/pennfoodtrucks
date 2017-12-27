# coding: utf-8
class FoodTruck < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :followers, through: :favorites, source: :user

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
    [genreBig, genreSmall1, genreSmall2].reject { |genre| genre == 'NULL' }
  end

  def recent_reviews
    reviews.order('date DESC')
  end

  def hour_to_time(hour)
    # Time is stored as 24hr decimal (ex: 15.5)
    Time.at(hour.to_f * 60 * 60).utc.strftime('%l:%M%p').strip
  end

  def hours_listing
    hours = []
    %w(MF Sa Su).each do |day|
      next if self["#{day}_open"].blank?
      open = hour_to_time(self["#{day}_open"])
      close = hour_to_time(self["#{day}_close"])
      hours << "#{open} – #{close} (#{day})"
    end
    hours
  end
end
