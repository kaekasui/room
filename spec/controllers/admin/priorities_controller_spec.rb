require 'spec_helper'

describe Admin::PrioritiesController do
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
    let(:priority) { create(:priority_example) }

    it "is success." do
      delete :destroy, { id: priority.id }
      expect(response.status).to eq 302
    end

    it "update the 'deleted_at'." do
      expect(priority.deleted_at).to be_nil
      delete :destroy, { id: priority.id }
      expect(priority.reload.deleted_at).not_to be_nil
    end

    it "redirect to :index" do
      delete :destroy, { id: priority.id }
      expect(response).to redirect_to admin_priorities_path
    end
  end

  describe "#update_all" do
    let(:priority1) { create(:priority_example) }
    let(:priority2) { create(:priority_example) }

    it "update the priorities." do
      expect(priority1.name).to eq "MyString"
      expect(priority2.name).to eq "MyString"

      post :update_all, priority: { priority1.id.to_s => { name: "A" }, priority2.id.to_s => { name: "B" }}
      expect(priority1.reload.name).to eq "A"
      expect(priority2.reload.name).to eq "B"
    end
  end
end
