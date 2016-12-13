module FoodTrucksHelper
  def genre_linker(genres)
    links = genres.collect do |genre|
      link_to genre, sort_path(genre: genre)
    end
    links.join(', ')
  end
end
