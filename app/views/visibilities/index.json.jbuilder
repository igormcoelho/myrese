json.array!(@visibilities) do |visibility|
  json.extract! visibility, :id, :type
  json.url visibility_url(visibility, format: :json)
end
