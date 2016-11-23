json.extract! food, :id, :type, :name, :price, :comments, :food_truck_id, :created_at, :updated_at
json.url food_url(food, format: :json)
