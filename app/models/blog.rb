class Blog < ActiveRecord::Base
  acts_as_paranoid

  has_many :blog_comments
  has_many :categories, through: :categorizations
  has_many :categorizations, as: :registrable, dependent: :destroy

  default_scope { order("posted_at DESC") }

  scope :with_no_draft, -> { where(draft: false) }
  scope :recent_blogs, -> { limit(5) }

  validates :title, :contents1, presence: true
  validates :title, length: { maximum: MAX_TEXT_FIELD_LENGTH }
  validates :contents1, :contents2, length: { maximum: MAX_TEXT_AREA_LENGTH }
end
