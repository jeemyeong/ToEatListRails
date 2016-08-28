json.array!(@foodstagrams) do |foodstagram|
  json.extract! foodstagram, :id, :instagram_id, :img, :tag
  json.url foodstagram_url(foodstagram, format: :json)
end
