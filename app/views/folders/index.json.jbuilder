json.array!(@folders) do |folder|
  json.extract! folder, :id, :filter_pattern, :infohash_id
  json.url folder_url(folder, format: :json)
end
