class Admin::BlogLinksController < ApplicationController
  before_action :set_blog_links, only: [:index, :update_all]
  before_action :set_blog_link, only: [:destroy]

  def index
  end

  def update_all
    # 既存リンク情報の更新
    @blog_links.each do |blog_link|
      blog_link_param = blog_link_params[blog_link.id.to_s]
      blog_link.update_attributes(blog_link_param.symbolize_keys)
    end

    # 新規リンク情報の作成
    unless blog_link_params["new"].blank?
      blog_link_params["new"].each do |param_id, value|
        BlogLink.create(title: value["title"], url: value["url"])
      end
    end

    redirect_to admin_blog_links_path
  end

 def destroy
    @blog_link.destroy
    redirect_to admin_blog_links_path
  end

  private

  def set_blog_links
    @blog_links = BlogLink.all
  end

  def set_blog_link
    @blog_link = BlogLink.find(params[:id])
  end

  def blog_link_params
    params.require(:blog_link)
  end
end
