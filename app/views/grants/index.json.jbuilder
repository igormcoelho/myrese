json.array!(@grants) do |grant|
  json.extract! grant, :id, :name, :number, :description, :start_date, :end_date, :funding_agency, :project_id, :profile_id
  json.url grant_url(grant, format: :json)
end
