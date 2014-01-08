require 'spec_helper'

describe BlogCommentsController do
  let(:blog) { create(:blog_example) }

  describe "#create" do
    context "when data is normal." do
      it "create a comment." do
        expect { post :create, { blog_comment: { author: "Author", content: "Content"}, blog_id: blog.id }}.to change(BlogComment, :count).by(1)
      end

      it "have current user data." do
        user = create(:user_example)
	sign_in user
        expect { post :create, { blog_comment: { author: "Author", content: "Content"}, blog_id: blog.id }}.to change(BlogComment, :count).by(1)
	expect(blog.blog_comments.first.created_by).to eq user.id
	expect(blog.blog_comments.first.updated_by).to eq user.id
	sign_out :user
      end
    end

    context "when author is blank." do
      it "cannot create a comment." do
        expect { post :create, { blog_comment: { author: "", content: "Content"}, blog_id: blog.id }}.to change(BlogComment, :count).by(0)
      end
    end

    context "when content is blank." do
      it "cannot create a comment." do
        expect { post :create, { blog_comment: { author: "Author", content: ""}, blog_id: blog.id }}.to change(BlogComment, :count).by(0)
      end
    end
  end
end
