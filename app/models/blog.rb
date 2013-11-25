class Blog < ActiveRecord::Base
  acts_as_paranoid

  has_many :blog_comments

  default_scope { order("created_at DESC") }

  scope :with_no_draft, -> { where(draft: false) }
  scope :recent_blogs, -> { limit(5) }

  validates :title, :contents1, presence: true
  validates :title, length: { maximum: MAX_TEXT_FIELD_LENGTH }
  validates :contents1, :contents2, length: { maximum: MAX_TEXT_AREA_LENGTH }
end
