json.array!(@weblinks) do |weblink|
  json.extract! weblink, :id, :infohash_id, :link
  json.url weblink_url(weblink, format: :json)
end
