class Admin::UsersController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_parent_users, only: [:index, :update_all]
  before_action :set_parent_user, only: [:destroy]

  def index
  end

  def update_all
    @users.each do |user|
      user_param = user_params[user.id.to_s]
      user.update_attributes(user_param.symbolize_keys)
    end

    redirect_to admin_users_path
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def set_parent_users
    #@users = User.parent_users
    @users = User.all
  end

  def set_parent_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user)
  end

  def set_menu
    @admin_menu = "setting"
  end
end
