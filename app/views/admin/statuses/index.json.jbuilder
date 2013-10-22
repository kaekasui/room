json.array!(@statuses) do |status|
  json.extract! status, :name, :position, :deleted_at
  json.url status_url(status, format: :json)
end
