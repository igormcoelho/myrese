json.array!(@folder_infohashes) do |folder_infohash|
  json.extract! folder_infohash, :id, :folder_id, :infohash_id
  json.url folder_infohash_url(folder_infohash, format: :json)
end
