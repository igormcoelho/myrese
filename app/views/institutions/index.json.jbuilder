json.array!(@institutions) do |institution|
  json.extract! institution, :id, :name, :website, :logo, :address, :itype
  json.url institution_url(institution, format: :json)
end
