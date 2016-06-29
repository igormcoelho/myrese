json.array!(@supervisions) do |supervision|
  json.extract! supervision, :id, :user_id, :title, :suptype, :mainsup, :profile_id, :date_begin, :date_end
  json.url supervision_url(supervision, format: :json)
end
