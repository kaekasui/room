class BlogComment < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :blog, dependent: :destroy

  default_scope { order("created_at DESC") }
  scope :recent_blog_comments, -> { limit(5) }
  scope :with_no_draft, -> { where(draft: false) }

  validates :title, :password, length: {maximum: MAX_TEXT_FIELD_LENGTH }
  validates :url, :mail, length: { maximum: MAX_LONG_TEXT_FIELD_LENGTH }
  validates :author, presence: true, length: { maximum: MAX_TEXT_FIELD_LENGTH }
  validates :content, presence: true, length: { maximum: MAX_TEXT_AREA_LENGTH }

  def blog_title
    Blog.find(self.blog_id).title
  end
end
