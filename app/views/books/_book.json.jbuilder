json.extract! book, :id, :isbn, :title, :autor, :classification, :published, :library_id, :created_at, :updated_at
json.url book_url(book, format: :json)