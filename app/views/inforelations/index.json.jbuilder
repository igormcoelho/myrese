json.array!(@inforelations) do |inforelation|
  json.extract! inforelation, :id, :infohash1, :infohash2
  json.url inforelation_url(inforelation, format: :json)
end
