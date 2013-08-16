class BlogCommentsController < ApplicationController
  before_action :set_blog_comment, only: [:show]

  def create
    @blog_comment = BlogComment.new(blog_comment_params)
    @blog_comment.update_attributes(blog_id: blog_id_param, ip: request.remote_ip)
    @blog = Blog.find(blog_id_param)

    respond_to do |format|
      if @blog_comment.save
        format.html { redirect_to @blog, notice: 'Blog comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blog }
        format.js
      else
        format.html { render @blog }
        format.json { render json: @blog_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def blog_comment_params
    params.require(:blog_comment).permit(:blog_id, :title, :author, :content, :url, :mail, :ip, :host, :password, :salt, :admin, :mixi, :draft)
  end

  def blog_id_param
    params.require(:blog_id)
  end
end
