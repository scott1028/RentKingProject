json.array!(@replies) do |reply|
  json.extract! reply, :id, :message, :created_user, :updated_user, :item_id
  json.url reply_url(reply, format: :json)
end
