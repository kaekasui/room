require 'spec_helper'

describe Blog do
  describe "data" do
    it "下書きではないこと" do
      blog = build(:blog_example)
      expect(blog.draft).to eq false
    end
  end

  describe "validation" do
    it "タイトルが入力必須であること" do
      blog = build(:blog_example, title: nil)
      expect(blog).to have(1).errors_on(:title)
    end

    it "コンテンツ1が入力必須であること" do
      blog = build(:blog_example, contents1: nil)
      expect(blog).to have(1).errors_on(:contents1)
    end

    it "コンテンツ2が入力必須でないこと" do
      blog = build(:blog_example, contents2: nil)
      expect(blog).to have(0).errors_on(:contents2)
    end
  end

  describe "scope" do
    context "with_no_draft" do
      it "下書きのブログが取得されないこと" do
        3.times { create(:blog_example) }
        2.times { create(:blog_example, draft: true) }
	blogs = Blog.all.with_no_draft.where(draft: true)
	expect(blogs.count).to eq 0
      end
    end

    context "recent_blogs" do
      it "最新のブログが5件取得されること" do
	3.times { create(:blog_example, created_at: "2013-08-01 09:00:00") }
	3.times { create(:blog_example, created_at: "2013-09-02 09:00:00") }
        3.times { create(:blog_example, created_at: "2013-09-01 09:00:00") }
	blogs = Blog.all.recent_blogs
	expect(blogs.count).to eq 5
        #expect(blogs.where(created_at: "2013-08-01 09:00:00").count).to eq 0
	#expect(blogs.where(created_at: "2013-09-01 09:00:00").count).to eq 2
	#expect(blogs.where(created_at: "2013-09-02 09:00:00").count).to eq 3
      end
    end
  end
end
