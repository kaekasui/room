class Status < ActiveRecord::Base
  acts_as_paranoid

  has_many :tickets
  validates :name, presence: true, length: { maximum: MAX_TEXT_FIELD_LENGTH }
end
