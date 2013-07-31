class Blog < ActiveRecord::Base

  has_many :blog_comments

  scope :recent_blogs, -> { limit(5) }
end
