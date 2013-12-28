class TicketCategory < ActiveRecord::Base
  has_many :ticket_category_cases
end
