require 'spec_helper'

describe "blogs/index" do

  describe "ブログの記事" do
    before do
      3.times { FactoryGirl.create(:blog) }

      @blogs = Blog.all.page(params[:page]).per(10)
      @recent_blogs = Blog.recent_blogs
      @recent_blog_comments = BlogComment.recent_blog_comments
      @blog_links = BlogLink.all
    end

    context "3件登録されている場合" do
      it "一覧に3件表示されること" do
        render
        expect(rendered).to have_selector("table.table > tr > th.post_at", count: 3)
      end
  
      it "「最近の記事」に3件表示されること" do
        render
        expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog", count: 3)
      end
    end

    context "6件登録されている場合" do
      before do
        3.times { FactoryGirl.create(:blog) }
      end

      it "一覧に6件表示されること" do
        render
        expect(rendered).to have_selector("table.table > tr > th.post_at", count: 6)
      end

      it "「最近の記事」に5件表示されること" do
        render
        expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog", count: 5)
      end
    end

    context "12件登録されている場合" do
      before do
        8.times { FactoryGirl.create(:blog) }
        FactoryGirl.create(:latest_blog)
      end

      it "一覧に10件表示されること" do
        render
        expect(rendered).to have_selector("table.table > tr > th.post_at", count: 10)
      end

      it "一覧の2ページ目に2件表示されること" do
        @blogs = Blog.all.page(2).per(10)
        render
        expect(rendered).to have_selector("table.table > tr > th.post_at", count: 2)
      end

      it "「最近の記事」に5件表示されること" do
        render
        expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog", count: 5)
      end

      it "「最近の記事」に最新の記事が表示されること" do
        render
        expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog", content: "Title2")
      end

      it "「最近の記事」に下書きの記事が表示されないこと" do
        FactoryGirl.create(:draft_blog)
        render
        expect(view.content_for(:sidebar)).to_not have_selector("ul.nav > li > a.recent_blog", content: "Title3")
      end
    end
  end
 
  describe "サイドメニュー" do
    before do
      @blogs = Blog.all.page(params[:page]).per(10)
      @recent_blogs = Blog.recent_blogs
      @recent_blog_comments = BlogComment.recent_blog_comments
      @blog_links = BlogLink.all
    end

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
