json.array!(@blog_comments) do |blog_comment|
  json.extract! blog_comment, :blog_id, :title, :author, :content, :url, :mail, :ip, :host, :password, :salt, :admin, :mixi, :draft
  json.url blog_comment_url(blog_comment, format: :json)
end
