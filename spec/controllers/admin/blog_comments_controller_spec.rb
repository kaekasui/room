require 'spec_helper'

describe Admin::BlogCommentsController do
  before do
    sign_in create(:user_example, admin: true)
  end

  describe "#index" do
    it "is success." do
      get :index
      expect(response.status).to eq 200
    end

    it "access :index" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#destroy" do
    let(:blog) { create(:blog_example) }
    let(:blog_comment) { create(:blog_comment_example, blog_id: blog.id) }

    it "is success." do
      delete :destroy, { id: blog_comment.id }
      expect(response.status).to eq 302
    end

    it "update the 'deleted_at'." do
      expect(blog_comment.deleted_at).to eq nil
      delete :destroy, { id: blog_comment.id }
      expect(blog_comment.reload.deleted_at).not_to eq nil
    end

    it "redirect to :index" do
      delete :destroy, { id: blog_comment.id }
      expect(response).to redirect_to admin_blog_comments_path
    end
  end

  after do
    sign_out :user
  end
end
