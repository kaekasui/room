class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:twitter]

  has_many :tickets
  before_save :set_code
  acts_as_paranoid

  scope :admins, -> { where(admin: true) }
  validates :email, uniqueness: false, presence: false

  def registered_twitter?
    user = self.same_code_twitter
    user.token.present? && user.secret.present? if user
  end

  def same_code_twitter
    User.where(code: self.code, provider: "twitter").first
  end

  private

  def set_code
    self.code = self.code.blank? ? generate_code : self.code
  end

  def generate_code
    code = SecureRandom.urlsafe_base64(6)
    self.class.where(code: code).blank? ? code : generate_code
  end
end
