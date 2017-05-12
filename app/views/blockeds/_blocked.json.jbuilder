json.extract! blocked, :id, :subscriptor_id, :end, :notes, :created_at, :updated_at
json.url blocked_url(blocked, format: :json)