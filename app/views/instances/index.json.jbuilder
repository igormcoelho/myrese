json.array!(@instances) do |instance|
  json.extract! instance, :id, :name, :pubKey, :pubKeyExpiration, :address, :allowAutomaticPull, :allowPull
  json.url instance_url(instance, format: :json)
end
