class Admin::UsersController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_parent_users, only: [:index, :update_all]
  before_action :set_parent_user, only: [:destroy]

  def index
  end

  def update_all
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def set_parent_users
    @users = User.parent_users
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
