json.array!(@activities) do |activity|
  json.extract! activity, :id, :title, :description, :start_date, :end_date, :position_id
  json.url activity_url(activity, format: :json)
end
