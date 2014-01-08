class Admin::BlogCommentsController < Admin::AdminBaseController
  before_action :set_menu
  before_action :set_blog, only: [:destroy]

  def index
    @blog_comments = BlogComment.page(params[:page]).per(20)
  end

  def destroy
    @blog_comment.destroy
    redirect_to admin_blog_comments_path
  end

  private

  def set_blog
    @blog_comment = BlogComment.find(params[:id])
  end

  def set_menu
    @admin_menu = "blog"
  end
end
