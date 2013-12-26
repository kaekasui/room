class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def sign_up_params
    params = devise_parameter_sanitizer.sanitize(:sign_up)
    params.store("type", "OriginalUser")
    params
  end
end
