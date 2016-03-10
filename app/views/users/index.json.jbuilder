json.array!(@users) do |user|
  json.extract! user, :id, :e_mail, :password
  json.url user_url(user, format: :json)
end
