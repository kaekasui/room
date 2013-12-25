class Ticket < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :project
  belongs_to :priority
  belongs_to :status
  belongs_to :ticket, foreign_key: "parent_id"
  belongs_to :tracker
  belongs_to :user
  belongs_to :version
  has_many :ticket_category_cases

  scope :finished, -> { joins(:status).where(statuses: {finished: true}) }
  scope :unfinish, -> { joins(:status).where(statuses: {finished: false}) }
  validates :title, presence: true, length: { maximum: MAX_TEXT_FIELD_LENGTH }
  validates :content, length: { maximum: MAX_TEXT_AREA_LENGTH }
  validates :status_id, :priority_id, :version_id, :project_id, :tracker_id, presence: true
end
