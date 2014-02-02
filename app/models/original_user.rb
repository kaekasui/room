class OriginalUser < User
  devise authentication_keys: :email
  validates :email, uniqueness: true,
		    length: { maximum: MAX_LONG_TEXT_FIELD_LENGTH },
		    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i },
                    if: :email_required?
  validates :password, confirmation: :password_confirmation,
		       length: { within: 6..MAX_TEXT_FIELD_LENGTH },
                       if: :password_required?
  validates :name, length: { maximum: MAX_TEXT_FIELD_LENGTH }

  protected

  def email_required?
    !password.nil? || !password_confirmation.nil?
  end

  def password_required?
    !password.nil? || !password_confirmation.nil?
  end
end
