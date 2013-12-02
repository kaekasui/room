class Admin::BlogCommentsController < Admin::AdminBaseController
  before_action :set_menu

  def index
    @blog_comments = BlogComment.page(params[:page]).per(20)
  end

  private

  def set_menu
    @admin_menu = "blog"
  end
end
