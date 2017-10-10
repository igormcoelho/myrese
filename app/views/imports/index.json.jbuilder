json.array!(@imports) do |import|
  json.extract! import, :id, :user_id, :url, :jsondata
  json.url import_url(import, format: :json)
end
