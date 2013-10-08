class SessionsController < ApplicationController

  # Omniauth
  def callback
    auth = request.env["omniauth.auth"]
    @user = User.find_for_oauth(auth) || User.create_with_oauth(auth)
    session[:user_id] = @user.parent_user.id

    if current_user and current_user.email.blank?
      redirect_to edit_user_path(@user.parent_user)
    else
      redirect_to :root, notice: I18n.t("flash.logged_in")
    end
  end 

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: I18n.t("flash.logged_out")
  end
end
