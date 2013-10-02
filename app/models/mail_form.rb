class MailForm < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: MAX_TEXT_AREA_LENGTH }
end
