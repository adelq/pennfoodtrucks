json.extract! food_truck, :id, :name, :cleanURL, :rating, :phone, :MF_open, :MF_close, :Sa_open, :Sa_close, :Su_open, :Su_close, :genreBig, :genreSmall1, :genreSmall2, :location, :blurb, :long, :lat, :intersection, :created_at, :updated_at
json.url food_truck_url(food_truck, format: :json)
