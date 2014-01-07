class Category < ActiveRecord::Base
  acts_as_paranoid
  validates :name, presence: true, length: { maximum: MAX_TEXT_FIELD_LENGTH }
end
