class BlogComment < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :blog, dependent: :destroy

  default_scope { order("created_at DESC") }
  scope :recent_blog_comments, -> { limit(5) }
  scope :with_no_draft, -> { where(draft: false) }

  validates :author, :content, presence: true

  def blog_title
    Blog.find(self.blog_id).title
  end
end
