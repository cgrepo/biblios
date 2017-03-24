json.extract! book_profile, :id, :published, :isbn, :title, :autor, :classificacion, :label, :book_id, :created_at, :updated_at
json.url book_profile_url(book_profile, format: :json)