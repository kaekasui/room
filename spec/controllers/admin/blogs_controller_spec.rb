require 'spec_helper'

describe Admin::BlogsController do
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

  describe "#new" do
    it "is success." do
      get :new
      expect(response.status).to eq 200
    end

    it "access :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    context "when create a blog." do
      context "with full data." do
        before do
          post :create, { blog: { title: "Title", contents1: "Contents1", contents2: "Contents2" }, commit: I18n.t("actions.create") }
	end

        it "create a record." do
          expect { post :create, { blog: { title: "Title", contents1: "Contents1" }, commit: I18n.t("actions.create") }}.to change(Blog, :count).by(1)
        end

        it "display messages." do
          expect(flash[:notice]).to eq I18n.t("flash.create_blog")
        end

	it "redirect to :index" do
          expect(response).to redirect_to admin_blogs_path
        end

	it "is not draft." do
          expect((assigns[:blog]).draft).to eq false
	end
      end

      context "with blank title." do
        it "cannot create a record." do
          expect { post :create, { blog: { title: "", contents1: "Contents1" }, commit: I18n.t("actions.create") }}.to change(Blog, :count).by(0)
        end

	it "display message." do
          pending
	end

	it "redirect to :new" do
          pending
	end
      end
    end
    
    context "when create a draft blog." do
      context "with full data." do
        before do
          post :create, { blog: { title: "Title", contents1: "Contents1", contents2: "Contents2" }, commit: I18n.t("actions.draft") }
	end

        it "create a record." do
          expect { post :create, { blog: { title: "Title", contents1: "Contents1" }, commit: I18n.t("actions.draft") }}.to change(Blog, :count).by(1)
        end

        it "display messages." do
          expect(flash[:notice]).to eq I18n.t("flash.create_draft_blog")
        end

	it "redirect to :index" do
          expect(response).to redirect_to admin_blogs_path
        end

	it "is draft." do
          expect((assigns[:blog]).draft).to eq true
	end
      end

      context "with blank title." do
        it "cannot create a record." do
          expect { post :create, { blog: { title: "", contents1: "Contents1" }, commit: I18n.t("actions.draft") }}.to change(Blog, :count).by(0)
        end

	it "display message." do
          pending
	end

	it "redirect to :new" do
          pending
	end
      end
    end
  end

  describe "#edit" do
    let(:blog) { create(:blog_example) }
    it "is success." do
      get :edit, {id: blog.id}
      expect(response.status).to eq 200
    end

    it "access :edit" do
      get :edit, {id: blog.id}
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    context "when update a blog." do
      let(:blog) { create(:blog_example) }

      context "with full data." do
        before do
          patch :update, { blog: { title: "Title", contents1: "Contents1", contents2: "Contents2" }, id: blog.id, commit: I18n.t("actions.update") }
	end

        it "update a record." do
          expect(assigns[:blog]).to eq blog
        end

        it "display messages." do
          expect(flash[:notice]).to eq I18n.t("flash.update_blog")
        end

	it "redirect to :index" do
          expect(response).to redirect_to admin_blogs_path
        end

	it "is not draft." do
          expect((assigns[:blog]).draft).to eq false
	end
      end

      context "with blank title." do
        before do
          patch :update, { blog: { title: "", contents1: "Contents1", contents2: "Contents2" }, id: blog.id, commit: I18n.t("actions.draft") }
	end

        it "raise errors." do
          expect((assigns[:blog]).errors.count).to eq 1
        end

	it "display message." do
          pending
	end

	it "redirect to :new" do
          pending
	end
      end
    end
    
    context "when update a draft blog." do
      let(:blog) { create(:blog_example, draft: true) }

      context "with full data." do
        before do
          patch :update, { blog: { title: "Title", contents1: "Contents1", contents2: "Contents2" }, id: blog.id, commit: I18n.t("actions.draft") }
	end

        it "update a record." do
          expect(assigns[:blog]).to eq blog
        end

        it "display messages." do
          expect(flash[:notice]).to eq I18n.t("flash.update_blog")
        end

	it "redirect to :index" do
          expect(response).to redirect_to admin_blogs_path
        end

	it "is draft." do
          expect((assigns[:blog]).draft).to eq true
	end
      end

      context "with blank title." do
        before do
          patch :update, { blog: { title: "", contents1: "Contents1", contents2: "Contents2" }, id: blog.id, commit: I18n.t("actions.draft") }
	end

        it "raise error." do
          expect((assigns[:blog]).errors.count).to eq 1
        end

	it "display message." do
          pending
	end

	it "redirect to :new" do
          pending
	end
      end
    end
  end

  describe "#destroy" do
    let(:blog) { create(:blog_example) }

    it "is success." do
      delete :destroy, { id: blog.id }
      expect(response.status).to eq 302
      # TODO:正しいステータスコードであるかを確認する必要あり
    end

    it "update the 'deleted_at'." do
      delete :destroy, { id: blog.id }
      expect((assigns[:blog]).deleted_at).not_to be_nil
    end
  end
end
