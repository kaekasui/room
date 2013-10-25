json.array!(@trackers) do |tracker|
  json.extract! tracker, :name, :position, :deleted_at
  json.url tracker_url(tracker, format: :json)
end
