class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_layout

  def new
    super
  end

  def create
    super
  end

  def show
    @original_user = OriginalUser.find_by_code(current_user.code) || OriginalUser.new
    @virtual_user = VirtualUser.find_by_code(current_user.code)
    @twitter_user = TwitterUser.find_by_code(current_user.code) || TwitterUser.new 
  end

  def sign_up_params
    params = devise_parameter_sanitizer.sanitize(:sign_up)
    params.store("type", "OriginalUser")
    params
  end

  def set_layout
    @control_users = true
  end
end
