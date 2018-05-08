json.extract! appointment, :id, :date, :fee, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
