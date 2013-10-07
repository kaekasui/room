class MailForm < ActiveRecord::Base
  acts_as_paranoid

  validates :content, presence: true, length: { maximum: MAX_TEXT_AREA_LENGTH }
end
