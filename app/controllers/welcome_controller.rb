class WelcomeController < ApplicationController
  def index
    @food_trucks = FoodTruck.all
    @hash = Gmaps4rails.build_markers(@food_trucks) do |ft, marker|
      marker.lat ft.long.to_f
      marker.lng ft.lat.to_f
      marker.infowindow ft.name
    end
    @recent_visits = Visit.order('timestamp DESC').limit(10)
    @featured = FoodTruck.where.not(blurb: 'NULL').order('RANDOM()').first
  end
end
