class Ticket < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :project
  belongs_to :priority
  belongs_to :status
  belongs_to :ticket, foreign_key: "parent_id"
  belongs_to :tracker
  belongs_to :user
  belongs_to :version
end
