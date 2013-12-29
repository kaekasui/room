class TicketCategory < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :project
  has_many :ticket_category_cases

  validates :name, presence: true, length: { maximum: MAX_TEXT_FIELD_LENGTH }
end
