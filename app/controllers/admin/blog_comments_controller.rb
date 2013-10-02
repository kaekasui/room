class Admin::BlogCommentsController < ApplicationController
  before_action :set_menu

  def index
    @blog_comments = BlogComment.all
  end

  private

  def set_menu
    @admin_menu = "blog"
  end
end
