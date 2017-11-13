json.extract! bed, :id, :bed_number, :room_id, :user_id, :booked, :expected_booking_date, :expected_vacancy_date, :created_at, :updated_at
json.url bed_url(bed, format: :json)
