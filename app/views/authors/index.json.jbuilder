json.array!(@authors) do |author|
  json.extract! author, :id, :given_name, :family_name
  json.url author_url(author, format: :json)
end
