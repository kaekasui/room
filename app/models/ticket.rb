class Ticket < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :priority
  belongs_to :status
end
