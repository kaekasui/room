class BlogComment < ActiveRecord::Base

  belongs_to :blog

  default_scope { order("created_at DESC") }
  default_scope { where(draft: false) }
  scope :recent_blog_comments, -> { limit(5) }

  validates :author, :content, presence: true

  def blog_title
    Blog.find(self.blog_id).title
  end
end
