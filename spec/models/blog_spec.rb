require 'spec_helper'

describe Blog do
  describe "data" do
    it "is not draft." do
      blog = build(:blog_example)
      expect(blog.draft).to eq false
    end

    it "have 2 or more comments" do
      blog = create(:blog_example)
      comments1 = create(:blog_comment_example, blog_id: blog.id)
      comments2 = create(:blog_comment_example, blog_id: blog.id)
      expect(blog.reload.blog_comments).to eq([comments1, comments2])
    end

    it "create a blog" do
      create(:blog_example)
      expect(Blog).to have(1).records
    end
  end

  describe "validation errors" do
    context "when the field is blank." do
      it "say that the 'title' is required." do
        blog = build(:blog_example, title: nil)
        expect(blog).to have(1).errors_on(:title)
      end

      it "say that the 'contents1' is required." do
        blog = build(:blog_example, contents1: nil)
        expect(blog).to have(1).errors_on(:contents1)
      end

      it "say that the 'contents2' is required." do
        blog = build(:blog_example, contents2: nil)
        expect(blog).to have(0).errors_on(:contents2)
      end
    end

    context "when enter up to above the max characters." do
      it "say that the 'title' enter up to 'MAX_TEXT_FIELD_LENGTH' characters" do
        blog = build(:blog_example, title: "a" * (MAX_TEXT_FIELD_LENGTH + 1))
        expect(blog).to have(1).errors_on(:title)
      end

      it "say that the 'contents1' enter up to 'MAX_TEXT_AREA_LENGTH' characters" do
        blog = build(:blog_example, contents1: "a" * (MAX_TEXT_AREA_LENGTH + 1))
	expect(blog).to have(1).errors_on(:contents1)
      end

      it "say that the 'contents2' enter up to 'MAX_TEXT_AREA_LENGTH' characters" do
        blog = build(:blog_example, contents2: "a" * (MAX_TEXT_AREA_LENGTH + 1))
	expect(blog).to have(1).errors_on(:contents2)
      end
    end
  end

  describe "scope" do
    context "default scope" do
      it "display recent blogs." do
        blog1 = create(:blog_example, created_at: "2013-08-01 09:00:00")
	blog2 = create(:blog_example, created_at: "2013-09-01 09:00:00")
	blogs = Blog.all.recent_blogs
	expect(blogs).to eq [blog2, blog1]
      end
    end

    context ".with_no_draft" do
      it "display the blogs without the draft." do
        3.times { create(:blog_example) }
        2.times { create(:blog_example, draft: true) }
	blogs = Blog.all.with_no_draft.where(draft: true)
	expect(blogs.count).to eq 0
      end
    end

    context ".recent_blogs" do
      it "display five blogs." do
	3.times { create(:blog_example, created_at: "2013-08-01 09:00:00") }
	3.times { create(:blog_example, created_at: "2013-09-02 09:00:00") }
        3.times { create(:blog_example, created_at: "2013-09-01 09:00:00") }
	blogs = Blog.all.recent_blogs
	expect(blogs.count).to eq 5
      end
    end
  end
end
