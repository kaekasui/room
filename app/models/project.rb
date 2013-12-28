class Project < ActiveRecord::Base
  acts_as_paranoid

  has_many :tickets

  validates :title, presence: true, length: { maximum: MAX_TEXT_FIELD_LENGTH }
  validates :content, length: { maximum: MAX_TEXT_AREA_LENGTH }
end

