json.extract! suggestion, :id, :title, :body, :status, :created_at, :updated_at
json.url suggestion_url(suggestion, format: :json)