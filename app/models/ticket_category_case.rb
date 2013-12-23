class TicketCategoryCase < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :ticket_category
end
