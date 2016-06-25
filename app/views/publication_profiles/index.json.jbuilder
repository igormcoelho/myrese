json.array!(@publication_profiles) do |publication_profile|
  json.extract! publication_profile, :id, :publication_id, :author, :profile_id
  json.url publication_profile_url(publication_profile, format: :json)
end
