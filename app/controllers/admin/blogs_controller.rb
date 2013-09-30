class Admin::BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    if I18n.t("actions.draft") == commit_param
      @blog.draft = true
      message = I18n.t("flash.create_draft_blog")
    else
      message = I18n.t("flash.create_blog")
    end
    respond_to do |format|
      if @blog.save
        format.html { redirect_to admin_blogs_path, notice: message }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update_attributes(blog_params)
        format.html { redirect_to admin_blogs_path, notice: I18n.t("flash.update_blog") }
        format.json { render json: @blog, status: :updated, location: @blog }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :contents1, :contents2)
  end

  def commit_param
    params.require(:commit)
  end
end
