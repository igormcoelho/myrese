json.array!(@positions) do |position|
  json.extract! position, :id, :title, :description, :start_date, :end_date, :profile_id, :institution_id
  json.url position_url(position, format: :json)
end
