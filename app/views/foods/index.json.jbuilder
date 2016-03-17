json.array!(@foods) do |food|
  json.extract! food, :id, :name, :gattung, :description
  json.url food_url(food, format: :json)
end
