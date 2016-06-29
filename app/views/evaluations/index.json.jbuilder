json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :user_id, :name
  json.url evaluation_url(evaluation, format: :json)
end
