class Admin::BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to admin_blogs_path, notice: I18n.t("flash.create_blog") }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @blog = Blog.new
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :contents1, :contents2)
  end
end
