class WelcomeController < ApplicationController
  def index
    @food_trucks = FoodTruck.all
    @hash = Gmaps4rails.build_markers(@food_trucks) do |ft, marker|
      marker.lat ft.long.to_f
      marker.lng ft.lat.to_f
      marker.infowindow ft.name
    end
  end
end
