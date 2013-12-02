require 'spec_helper'

describe "blogs/show" do
  before do
    @blog = create(:blog_example)
    @blog_comment = BlogComment.new
    @blog_comments = @blog.blog_comments

    @recent_blogs = Blog.with_no_draft.recent_blogs
    @recent_blog_comments = BlogComment.recent_blog_comments
    @blog_links = BlogLink.all
  end

  describe "the blog" do

    it "display the title." do
      render
      expect(rendered).to have_selector("table.table > tr > th > a", content: @blog.title)
    end

    it "display the contents1." do
      render
      expect(rendered).to have_selector("table.table > tr > td.contents1", content: @blog.contents1)
    end

    it "display the contents2." do
      render
      expect(rendered).to have_selector("table.table > tr > td.contents2", content: @blog.contents2)
    end

    it "display the posted_at." do
      render
      expect(rendered).to have_selector("table.table > tr > th.post_at", content: I18n.l(@blog.posted_at))
    end

    it "display the comment count." do
      create(:blog_comment_example, blog_id: @blog.id)
      render
      expect(rendered).to have_selector("table.table > tr > td.align_right > a", content: "Comments(#{@blog.blog_comments.count})")
    end
  end

  describe "the blog comment form" do
    it "display the title." do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:title))
    end

    it "display the url." do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:url))
    end

    it "display the mail." do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:mail))
    end

    it "display the author." do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:author))
    end

    it "display the content." do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: BlogComment.human_attribute_name(:content))
    end
  end

  describe "side menu" do

    it "display the profile." do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.profile"))
    end

    it "display the recent blogs." do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.recent_blogs"))
    end

    it "display the recent blog comments." do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.recent_blog_comments"))
    end

    it "display the blog links." do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.blog_links"))
    end

    it "display the mail form." do
      render
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.mail_form"))
    end
  end

  describe "blog comments" do
    context "with 3 blog comments." do
      before do
        3.times { create(:blog_comment_example, blog_id: @blog.id) }
        @blog_comments = @blog.blog_comments
      end

      it "display the blog comments on the list." do
        render
        expect(rendered).to have_selector("#blog_comments > div.blog_comment", count: 3)
      end

      it "display the blog comments on the side menu." do
        render
        expect(view.content_for(:sidebar)).to have_selector("ul.nav > li > a.recent_blog_comment", count: 3)
      end
    end
  end
end
