class Ticket < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :project
  belongs_to :priority
  belongs_to :status
  belongs_to :ticket, foreign_key: "parent_id"
  belongs_to :tracker
  belongs_to :user
  belongs_to :version

  scope :finished, -> { joins(:status).where(statuses: {finished: true}) }
  scope :unfinish, -> { joins(:status).where(statuses: {finished: false}) }
end
