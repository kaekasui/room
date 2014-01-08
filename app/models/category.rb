class Category < ActiveRecord::Base
  acts_as_paranoid
  validates :name, presence: true, length: { maximum: MAX_TEXT_FIELD_LENGTH }
  belongs_to :project
  has_many :categorizations, dependent: :destroy
  has_many :tickets, through: :categorizations
  has_many :blogs, through: :categorizations
end
