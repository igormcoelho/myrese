json.array!(@pkeywords) do |pkeyword|
  json.extract! pkeyword, :id, :publication_id, :infohash_id, :keyword
  json.url pkeyword_url(pkeyword, format: :json)
end
