json.extract! room, :id, :description, :rate, :bathroom, :wifi, :created_at, :updated_at
json.url room_url(room, format: :json)
