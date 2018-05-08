json.extract! patient, :id, :name, :email, :address, :alergies, :medical_notes, :created_at, :updated_at
json.url patient_url(patient, format: :json)
