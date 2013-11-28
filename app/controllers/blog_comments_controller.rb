class BlogCommentsController < ApplicationController

  def create
    @blog_comment = BlogComment.new(blog_comment_params)
    @blog_comment.update_attributes(blog_id: blog_id_param, ip: request.remote_ip)
    @blog = Blog.find(blog_id_param)

    respond_to do |format|
      if @blog_comment.save
        format.html { redirect_to @blog }
        format.js
      else
        format.html { render @blog }
        format.js { render action: "failure" }
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
