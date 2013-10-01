class BlogLink < ActiveRecord::Base
  acts_as_paranoid

  scope :with_no_draft, -> { where(draft: false) }
end
