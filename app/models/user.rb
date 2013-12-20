class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:twitter]

  before_create :set_access_code
  acts_as_paranoid

  validates :email, uniqueness: false, presence: false

  def registered_twitter?
    user = self.same_code_twitter
    user.token.present? && user.secret.present? if user
  end

  def same_code_twitter
    User.where(access_code: self.access_code, provider: "twitter").first
  end

  private

  def set_access_code
    self.access_code = self.access_code.blank? ? generate_access_code : self.access_code
  end

  def generate_access_code
    code = SecureRandom.urlsafe_base64(6)
    self.class.where(access_code: code).blank? ? code : generate_access_code
  end
end
