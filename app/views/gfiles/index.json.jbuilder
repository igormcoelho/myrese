json.array!(@gfiles) do |gfile|
  json.extract! gfile, :id, :name, :description, :size, :infohash_id
  json.url gfile_url(gfile, format: :json)
end
