json.array!(@pauthors) do |pauthor|
  json.extract! pauthor, :id, :publication_id, :user_id
  json.url pauthor_url(pauthor, format: :json)
end
