class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]

  def edit
  end

  def update
    @user.email = email_param
    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, notice: I18n.t("flash.create_user") }
      end
    end    
  end

  private
  def email_param
    param = params.require(:user).permit(:email)
    param[:email]
  end

  def find_user
    @user = current_user
  end
end
