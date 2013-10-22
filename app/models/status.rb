class Status < ActiveRecord::Base
  acts_as_paranoid

  has_many :tickets
end
