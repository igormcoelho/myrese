json.array!(@infohashes) do |infohash|
  json.extract! infohash, :id, :code, :visibility_id, :user_id, :group_id
  json.url infohash_url(infohash, format: :json)
end
