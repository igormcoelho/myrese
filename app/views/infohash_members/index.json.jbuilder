json.array!(@infohash_members) do |infohash_member|
  json.extract! infohash_member, :id, :infohash_id, :author, :identification
  json.url infohash_member_url(infohash_member, format: :json)
end
