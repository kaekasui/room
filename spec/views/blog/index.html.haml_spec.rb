require 'spec_helper'

describe "blogs/index" do
  describe "display blogs list" do
    before do
      @blogs = Blog.with_no_draft.page(params[:page]).per(10)
      @recent_blogs = Blog.with_no_draft.recent_blogs
      @recent_blog_comments = BlogComment.recent_blog_comments
      @blog_links = BlogLink.all
    end

    context "with 3 blogs." do
      before do
        3.times { create(:blog_example) }
      end

      it "display 3 blogs on the list." do
        render
        expect(rendered).to have_selector("table.table > tr > th.post_at", count: 3)
      end

      it "display 3 blogs on the side menu." do
        render
        expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog", count: 3)
      end

      it "don't display the draft blogs." do
        create(:blog_example, draft: true)
        render
        expect(rendered).to have_selector("table.table > tr > th.post_at", count: 3)
        expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog", count: 3)
      end
    end

    context "with 6 blogs." do
      before do
        6.times { create(:blog_example) }
        render
      end

      it "display 6 blogs on the list." do
        expect(rendered).to have_selector("table.table > tr > th.post_at", count: 6)
      end

      it "display 5 blogs on the side menu." do
        expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog", count: 5)
      end
    end

    context "with 12 blogs" do
      before do
        12.times { create(:blog_example) }
        render
      end
      context "on the first page." do
        it "display 10 blogs on the list." do
          expect(rendered).to have_selector("table.table > tr > th.post_at", count: 10)
        end

        it "display 5 blogs on the side menu." do
          expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog", count: 5)
        end
      end

      context "on the second page." do
        it "display 2 blogs on the list." do
          @blogs = Blog.with_no_draft.page(2).per(10)
	  expect(@blogs.count).to eq 2
        end

        it "display 5 blogs on the side menu." do
          expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog", count: 5)
        end
      end
    end
  end

=begin
  describe "サイドメニュー" do
    before do
      3.times { FactoryGirl.create(:blog) }
      @blogs = Blog.with_no_draft.page(params[:page]).per(10)
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
=end
end
