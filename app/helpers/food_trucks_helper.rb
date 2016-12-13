module FoodTrucksHelper
  def genre_linker(genres)
    links = genres.collect do |genre|
      link_to genre, sort_path(genre: genre)
    end
    links.join(', ')
  end

  def location_link(food_truck)
    link_to food_truck.intersection,
            "https://www.google.com/maps/preview/?q=#{food_truck.lat},#{food_truck.long}"
  end
end
