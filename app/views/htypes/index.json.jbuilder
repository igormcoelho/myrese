json.array!(@htypes) do |htype|
  json.extract! htype, :id, :name
  json.url htype_url(htype, format: :json)
end
