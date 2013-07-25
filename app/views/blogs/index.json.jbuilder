json.array!(@blogs) do |blog|
  json.extract! blog, :title, :blog_category_code, :contents1, :contents2, :draft, :deleted_at
  json.url blog_url(blog, format: :json)
end
