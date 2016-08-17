json.array!(@identifications) do |identification|
  json.extract! identification, :id, :title, :service, :location
  json.url identification_url(identification, format: :json)
end
