class SessionsController < ApplicationController

  # Omniauth
  def callback
    auth = request.env["omniauth.auth"]
    @user = User.find_for_oauth(auth) || User.create_with_oauth(auth)
    session[:user_id] = @user.parent_user.id

    redirect_to :root, notice: I18n.t("flash.logged_in")
  end 

  def destroy
    session[:user_id] = nil

    redirect_to :root, notice: I18n.t("flash.logged_out")
  end
end
