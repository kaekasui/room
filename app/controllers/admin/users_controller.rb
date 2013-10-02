class Admin::UsersController < ApplicationController
  before_action :set_menu
  before_action :set_users, only: [:update_all] 

  def index
  end

  def update_all

  end

  private

  def set_users
    @users = User.all
  end

  def user_params
    params.require(:user)
  end

  def set_menu
    @admin_menu = "setting"
  end
end
