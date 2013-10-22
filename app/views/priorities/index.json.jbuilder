json.array!(@priorities) do |priority|
  json.extract! priority, :name, :position, :deleted_at
  json.url priority_url(priority, format: :json)
end
