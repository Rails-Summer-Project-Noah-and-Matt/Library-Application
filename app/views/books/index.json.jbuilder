json.array!(@books) do |book|
  json.extract! book, :id, :title, :is_active
  json.url book_url(book, format: :json)
end
