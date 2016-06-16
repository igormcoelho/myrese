json.array!(@groupmembers) do |groupmember|
  json.extract! groupmember, :id, :user_id, :group_id
  json.url groupmember_url(groupmember, format: :json)
end
