json.array!(@pubtypes) do |pubtype|
  json.extract! pubtype, :id, :name
  json.url pubtype_url(pubtype, format: :json)
end
