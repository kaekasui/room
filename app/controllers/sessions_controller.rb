class SessionsController < ApplicationController

  # Omniauth
  def callback
    auth = request.env["omniauth.auth"]
    @user = User.find_for_oauth(auth) || User.create_with_oauth(auth)

    redirect_to :root, notice: I18n.t("flash.logged_in")
  end 
end
