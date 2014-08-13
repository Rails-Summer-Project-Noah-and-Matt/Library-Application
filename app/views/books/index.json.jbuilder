json.array!(@books) do |book|
  json.extract! book, :id, :title, :isbn10, :isbn13, :is_active
  json.url book_url(book, format: :json)
end
