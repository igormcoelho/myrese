json.array!(@publications) do |publication|
  json.extract! publication, :id, :ptype, :title, :journal, :year, :doi, :infohash_id
  json.url publication_url(publication, format: :json)
end
