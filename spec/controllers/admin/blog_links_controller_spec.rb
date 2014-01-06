require 'spec_helper'

describe Admin::BlogLinksController do
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

  describe "#edit" do
    let(:blog_link) { create(:blog_link_example) }
    before do
      get :edit, { id: blog_link.id }
    end

    it "is success." do
      expect(response.status).to eq 200
    end

    it "access :edit" do
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    context "when update a blog link." do
      let(:blog_link) { create(:blog_link_example) }

      context "with full data." do
        before do
          patch :update, { blog_link: { title: "Title", url: "http://example.com" }, id: blog_link.id, commit: I18n.t("actions.update") }
	end

        it "update a record." do
          expect(assigns[:blog_link]).to eq blog_link
        end

	it "redirect to :index" do
          expect(response).to redirect_to admin_blog_links_path
        end
      end
    end
  end

  describe "#destroy" do
    let(:blog_link) { create(:blog_link_example) }

    it "is success." do
      delete :destroy, { id: blog_link.id }
      expect(response.status).to eq 302
    end

    it "update the 'deleted_at'." do
      expect(blog_link.deleted_at).to be_nil
      delete :destroy, { id: blog_link.id }
      expect(blog_link.reload.deleted_at).not_to be_nil
    end

    it "redirect to :index" do
      delete :destroy, { id: blog_link.id }
      expect(response).to redirect_to admin_blog_links_path
    end
  end

  describe "#update_all" do
    let(:blog_link1) { create(:blog_link_example) }
    let(:blog_link2) { create(:blog_link_example) }

    it "update the blog links." do
      expect(blog_link1.title).to eq "Title1"
      expect(blog_link2.title).to eq "Title1"

      post :update_all, blog_link: { blog_link1.id.to_s => { title: "A", url: "http://example.com" }, blog_link2.id.to_s => { title: "B", url: "http://example.com" }}
      expect(blog_link1.reload.title).to eq "A"
      expect(blog_link2.reload.title).to eq "B"
    end
  end
end
