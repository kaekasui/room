require 'spec_helper'

describe "blogs/index" do
  before do
    @blogs = Blog.all.page(params[:page]).per(10)
    @recent_blogs = Blog.recent_blogs
    @recent_blog_comments = BlogComment.recent_blog_comments
    @blog_links = Blog.all
  end

  describe "サイドメニュー" do

    it "プロフィールが表示されること" do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.profile"))
    end

    it "最近の記事が表示されること" do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.recent_blogs"))
    end

    it "最近のコメントが表示されること" do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.recent_blog_comments"))
    end

    it "リンクが表示されること" do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.blog_links"))
    end

    it "メールフォームが表示されること" do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.mail_form"))
    end
  end
end
