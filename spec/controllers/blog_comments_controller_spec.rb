require 'spec_helper'

describe BlogCommentsController do
  let(:blog) { create(:blog_example) }

  describe "#create" do
    context "when data is normal." do
      it "create a comment." do
        expect { post :create, { blog_comment: { author: "Author", content: "Content"}, blog_id: blog.id }}.to change(BlogComment, :count).by(1)
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
