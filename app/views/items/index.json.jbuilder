json.array!(@items) do |item|
  json.extract! item, :id, :label, :description, :genre, :price, :photo
  json.url post_url(item, format: :json)
end
