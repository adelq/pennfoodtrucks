json.extract! review, :id, :food_truck_id, :title, :owner, :email, :date, :comment, :overall, :quality, :speed, :quantity, :bang, :friendliness, :display_rev, :owner_ip, :staff, :created_at, :updated_at
json.url review_url(review, format: :json)
