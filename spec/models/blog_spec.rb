require 'spec_helper'

describe Blog do
  describe "record" do
    it "is not draft." do
      blog = build(:blog_example)
      expect(blog.draft).to eq false
    end

    it "have 2 comments." do
      blog = create(:blog_example)
      comments1 = create(:blog_comment_example, blog_id: blog.id)
      comments2 = create(:blog_comment_example, blog_id: blog.id)
      expect(blog.reload.blog_comments).to eq([comments1, comments2])
    end

    it "create a blog." do
      create(:blog_example)
      expect(Blog).to have(1).records
    end

    describe "acts_as_paranoid" do
      it "destroy a blog." do
        blog = create(:blog_example)
	expect(blog.deleted_at).to be_nil
        blog.destroy
	expect(blog.deleted_at).not_to be_nil
      end
    end
  end

  describe "validation test" do
    context "when blank." do
      it "title is required." do
        blog = build(:blog_example, title: nil)
        expect(blog).to have(1).errors_on(:title)
      end

      it "contents1 is required." do
        blog = build(:blog_example, contents1: nil)
        expect(blog).to have(1).errors_on(:contents1)
      end

      it "contents2 is not required." do
        blog = build(:blog_example, contents2: nil)
        expect(blog).to have(0).errors_on(:contents2)
      end
    end

    context "when exceed max characters." do
      it "with title." do
        blog = build(:blog_example, title: "a" * (MAX_TEXT_FIELD_LENGTH + 1))
        expect(blog).to have(1).errors_on(:title)
      end

      it "with contents1" do
        blog = build(:blog_example, contents1: "a" * (MAX_TEXT_AREA_LENGTH + 1))
	expect(blog).to have(1).errors_on(:contents1)
      end

      it "with contents2" do
        blog = build(:blog_example, contents2: "a" * (MAX_TEXT_AREA_LENGTH + 1))
	expect(blog).to have(1).errors_on(:contents2)
      end
    end
  end

  describe "scope" do
    describe "default scope" do
      it "display recent blogs." do
        blog1 = create(:blog_example, posted_at: "2013-08-01 09:00:00")
	blog2 = create(:blog_example, posted_at: "2013-09-01 09:00:00")
	blogs = Blog.all.recent_blogs
	expect(blogs).to eq [blog2, blog1]
      end
    end

    describe ".with_no_draft" do
      it "display the blogs without the draft." do
        create(:blog_example)
        create(:blog_example, draft: true)
	blogs = Blog.all.with_no_draft.where(draft: true)
	expect(blogs.count).to eq 0
      end
    end

    describe ".recent_blogs" do
      it "display five blogs." do
	3.times { create(:blog_example, created_at: "2013-08-01 09:00:00") }
	3.times { create(:blog_example, created_at: "2013-09-02 09:00:00") }
	blogs = Blog.all.recent_blogs
	expect(blogs.count).to eq 5
      end
    end
  end
end
