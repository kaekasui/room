json.array!(@projects) do |project|
  json.extract! project, :title, :content, :deleted_at
  json.url project_url(project, format: :json)
end
