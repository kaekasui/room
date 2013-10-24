class Version < ActiveRecord::Base
  acts_as_paranoid

  has_many :tickets
end
