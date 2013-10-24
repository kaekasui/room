class Project < ActiveRecord::Base
  acts_as_paranoid

  has_many :tickets

  validates :title, presence: true
end
