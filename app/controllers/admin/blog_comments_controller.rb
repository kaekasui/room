class Admin::BlogCommentsController < ApplicationController

  def index
    @blog_comments = BlogComment.all
  end
end
