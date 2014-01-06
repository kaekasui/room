require 'spec_helper'

describe Admin::ProjectsController do
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

  describe "#show" do
    let(:project) { create(:project_example) }

    it "is success." do
      get :show, id: project.id
      expect(response.status).to eq 200
    end

    it "access :show" do
      get :show, id: project.id
      expect(response).to render_template(:show)
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
    before do
      post :create, { project: { title: "Title", content: "Content" }}
    end

    it "is success." do
      expect(response.status).to eq 302 
    end

    it "redirect to :index" do
      expect(response).to redirect_to(admin_projects_path)
    end
  end

  describe "#edit" do
    let(:project) { create(:project_example) }
    before do
      get :edit, { id: project.id }
    end

    it "is success." do
      expect(response.status).to eq 200
    end

    it "access :edit" do
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    let(:project) { create(:project_example) }

    before do
      patch :update, { project: { title: "Title", content: "Content" }, id: project.id }
    end

    it "update a record." do
      expect(assigns[:project]).to eq project
    end

    it "redirect to :index" do
      expect(response).to redirect_to(admin_projects_path)
    end
  end

  describe "#destroy" do
    let(:project) { create(:project_example) }

    it "is success." do
      delete :destroy, { id: project.id }
      expect(response.status).to eq 302
    end

    it "update the 'deleted_at'." do
      expect(project.deleted_at).to be_nil
      delete :destroy, { id: project.id }
      expect(project.reload.deleted_at).not_to be_nil
    end

    it "redirect to :index" do
      delete :destroy, { id: project.id }
      expect(response).to redirect_to(admin_projects_path)
    end
  end
end
