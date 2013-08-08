require 'spec_helper'

describe "blogs/show" do
  before do
    @blog = stub_model(Blog, title: "Title", contents1: "Contents1", contents2: "Contents2", created_at: Time.now)
    @blog_comment = BlogComment.new
    @blog_comments = @blog.blog_comments

    @blogs = Blog.all.page(params[:page]).per(10)
    @recent_blogs = Blog.recent_blogs
    @recent_blog_comments = BlogComment.recent_blog_comments
    @blog_links = BlogLink.all
  end

  describe "ブログの記事" do

    it "タイトルが表示されること" do
      render
      expect(rendered).to have_selector("table.table > tr > th > a", content: @blog.title)
    end

    it "記事1が表示されること" do
      render
      expect(rendered).to have_selector("table.table > tr > td.contents1", content: @blog.contents1)
    end

    it "記事2が表示されること" do
      render
      expect(rendered).to have_selector("table.table > tr > td.contents2", content: @blog.contents2)
    end

    it "作成日時が表示されること" do
      #TODO: created_at -> post_at
      render
      expect(rendered).to have_selector("table.table > tr > th.post_at", content: I18n.l(@blog.created_at))
    end

    it "コメント数が表示されること" do
      render
      expect(rendered).to have_selector("table.table > tr > td.align_right > a", content: "Comments(#{@blog.blog_comments.count})")
    end
  end

  describe "コメントの入力フォーム" do
    it "タイトルが表示されること" do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:title))
    end

    it "URLが表示されること" do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:url))
    end

    it "メールアドレスが表示されること" do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:mail))
    end

    it "名前が表示されること" do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:author))
    end

    it "内容が表示されること" do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:content))
    end
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
