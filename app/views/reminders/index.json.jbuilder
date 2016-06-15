json.array!(@reminders) do |reminder|
  json.extract! reminder, :id, :dtime, :infohash_id
  json.url reminder_url(reminder, format: :json)
end
