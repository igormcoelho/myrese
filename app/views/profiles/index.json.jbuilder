json.array!(@profiles) do |profile|
  json.extract! profile, :id, :shortbio, :user_id
  json.url profile_url(profile, format: :json)
end
