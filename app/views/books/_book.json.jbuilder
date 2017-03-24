json.extract! book, :id, :entryDate, :copy, :volumn, :tome, :accessible, :profile, :library_id, :created_at, :updated_at
json.url book_url(book, format: :json)