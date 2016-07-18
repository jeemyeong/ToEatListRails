json.array!(@foods) do |food|
  json.extract! food, :id, :name, :category, :description, :restaurant, :loca_simple, :loca_map, :image_file
  json.url food_url(food, format: :json)
end
