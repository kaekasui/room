class BlogsController < ApplicationController
  before_action :set_blog, only: [:show]
  before_action :set_menu, only: [:index, :show]

  def index
    @blogs = Blog.with_no_draft.page(params[:page]).per(10)
  end

  def show
    @blog_comment = BlogComment.new
    @blog_comments = @blog.blog_comments
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_menu
    @recent_blogs = Blog.with_no_draft.recent_blogs
    @recent_blog_comments = BlogComment.recent_blog_comments
    @blog_links = BlogLink.with_no_draft
  end
end
