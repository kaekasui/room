class BlogComment < ActiveRecord::Base

  belongs_to :blog

  default_scope { order("created_at DESC") }
  scope :recent_blog_comments, -> { limit(5) }

  def blog_title
    Blog.find(self.blog_id).title
  end
end
