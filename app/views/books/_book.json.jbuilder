json.extract! book, :id, :title, :publication_date, :chapters, :page_count, :cover, :description, :created_at, :updated_at
json.url book_url(book, format: :json)
json.cover url_for(book.cover)
