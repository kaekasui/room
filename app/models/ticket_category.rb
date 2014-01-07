class TicketCategory < Category
  belongs_to :project
  has_many :ticket_category_cases
  has_many :tickets, through: :ticket_category_cases
end
