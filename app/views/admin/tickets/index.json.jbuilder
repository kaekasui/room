json.array!(@tickets) do |ticket|
  json.extract! ticket, :code, :title, :content, :progress, :status_id, :priority_id, :version_id, :user_id, :created_by, :deleted_at
  json.url ticket_url(ticket, format: :json)
end
