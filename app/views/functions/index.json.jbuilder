json.array!(@functions) do |function|
  json.extract! function, :name, :position, :deleted_at
  json.url function_url(function, format: :json)
end
