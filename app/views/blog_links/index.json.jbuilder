json.array!(@blog_links) do |blog_link|
  json.extract! blog_link, :title, :author, :introduction, :url, :position, :draft, :deleted_at
  json.url blog_link_url(blog_link, format: :json)
end
