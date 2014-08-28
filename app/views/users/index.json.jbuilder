json.array!(@users) do |user|
  json.extract! user, :id, :email, :admin, :blocked
  json.url useradmin_url(user, format: :json)
end
