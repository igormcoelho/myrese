json.array!(@tags) do |tag|
  json.extract! tag, :id, :user_id, :tagname, :infohash_id
  json.url tag_url(tag, format: :json)
end
