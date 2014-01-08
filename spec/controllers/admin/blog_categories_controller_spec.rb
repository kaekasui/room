require 'spec_helper'

describe Admin::BlogCategoriesController do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    controller.stub(:authenticate_user!).and_return true
    administrator = create(:original_user_example, admin: true)
    sign_in administrator
  end

  describe "#index" do
    it "is success." do
      get :index
      expect(response.status).to eq 200
    end

    it "access the blogs list page." do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#destroy" do
    let(:blog_category) { create(:blog_category_example) }
    before do
      delete :destroy, { id: blog_category.id }
    end

    it "is success." do
      expect(blog_category.reload.deleted_at).not_to eq nil
      expect(response.status).to eq 302
    end

    it "response redirect to the blog categories list." do
      expect(blog_category.reload.deleted_at).not_to eq nil
      expect(response).to redirect_to(admin_blog_categories_path)
    end
  end

  after do
    sign_out :user
  end
end
