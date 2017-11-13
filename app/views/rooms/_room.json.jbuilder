json.extract! room, :id, :pg_id, :room_number, :room_type_id, :floor_id, :number_of_beds, :created_at, :updated_at
json.url room_url(room, format: :json)
