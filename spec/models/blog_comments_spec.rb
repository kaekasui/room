require 'spec_helper'

describe BlogComment do
  let! (:blog) { create(:blog_example) }
  let! (:blog_comment) { create(:blog_comment_example, blog_id: blog.id) }

  describe "record" do
    it "is not administrator." do
      expect(blog_comment.admin).to eq false
    end

    it "belongs to a blog." do
      expect(blog_comment.blog).to eq blog
    end

    it "create a blog comment." do
      expect(BlogComment).to have(1).records
    end

    it "create one record." do
      expect{ create(:blog_comment_example, blog_id: blog.id) }.to change(BlogComment, :count).by(1)
    end

    describe "acts_as_paranoid" do
      it "destroy a blog comment." do
        expect(blog_comment.deleted_at).to be_nil
        blog_comment.destroy
	expect(blog_comment.deleted_at).not_to be_nil
      end
    end
  end

  describe "validation test" do
    context "when blank" do
      it "title is not required." do
        blog_comment.title = ""
        expect(blog_comment).to have(0).errors_on(:title)
      end

      it "author is required." do
        blog_comment.author = ""
	expect(blog_comment).to have(1).errors_on(:author)
      end

      it "content is required." do
        blog_comment.content = ""
	expect(blog_comment).to have(1).errors_on(:content)
      end

      it "url is not required." do
        blog_comment.url = ""
	expect(blog_comment).to have(0).errors_on(:url)
      end

      it "mail is not required." do
        blog_comment.mail = ""
        expect(blog_comment).to have(0).errors_on(:mail)
      end
    end

    context "when exceed max characters." do
      it "with title." do
        blog_comment.title = "a" * (MAX_TEXT_FIELD_LENGTH + 1)
        expect(blog_comment).to have(1).errors_on(:title)
      end

      it "with author." do
        blog_comment.author = "a" * (MAX_TEXT_FIELD_LENGTH + 1)
        expect(blog_comment).to have(1).errors_on(:author)
      end

      it "with content." do
        blog_comment.content = "a" * (MAX_TEXT_AREA_LENGTH + 1)
        expect(blog_comment).to have(1).errors_on(:content)
      end
    end
  end

  describe "scope" do
    describe "default scope" do
      it "display recent blog comments." do
        blog_comment.created_at = "2013-09-01 09:00:00"
	blog_comment.blog_id = blog.id
        blog_comment2 = create(:blog_comment_example, blog_id: blog.id, created_at: "2013-08-01 09:00:00")
	blog_comments = BlogComment.all
	expect(blog_comments).to eq [blog_comment2, blog_comment]
      end
    end

    describe ".with_no_draft" do
      it "display the blog comments without the draft." do
        create(:blog_comment_example)
        create(:blog_comment_example, draft: true)
	blog_comments = BlogComment.all.with_no_draft.where(draft: true)
	expect(blog_comments.count).to eq 0
      end
    end

    describe ".recent_blog_comments" do
       it "display five blog comments." do
	3.times { create(:blog_comment_example, created_at: "2013-08-01 09:00:00") }
	3.times { create(:blog_comment_example, created_at: "2013-09-02 09:00:00") }
	blog_comments = BlogComment.all.recent_blog_comments
	expect(blog_comments.count).to eq 5
      end
    end
  end

  describe "#blog_title" do
    it "blog title" do
      expect(blog_comment.blog_title).to eq blog.title
    end
  end
end
