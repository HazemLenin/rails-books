json.extract! book_status, :id, :user_id, :book_id, :status_id, :created_at, :updated_at
json.url book_status_url(book_status, format: :json)
