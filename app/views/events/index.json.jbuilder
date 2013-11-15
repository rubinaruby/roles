json.array!(@events) do |event|
  json.extract! event, :start_time, :end_time, :title, :description
  json.url event_url(event, format: :json)
end
