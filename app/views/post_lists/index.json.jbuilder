json.array!(@post_lists) do |post_list|
  json.extract! post_list, :id, :label, :description, :genre, :price, :photo
  json.url post_list_url(post_list, format: :json)
end
