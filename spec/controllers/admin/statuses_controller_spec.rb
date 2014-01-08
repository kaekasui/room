require 'spec_helper'

describe Admin::StatusesController do
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
    let(:status) { create(:status_example) }

    it "is success." do
      delete :destroy, { id: status.id }
      expect(response.status).to eq 302
    end

    it "update the 'deleted_at'." do
      expect(status.deleted_at).to be_nil
      delete :destroy, { id: status.id }
      expect(status.reload.deleted_at).not_to be_nil
    end

    it "redirect to :index" do
      delete :destroy, { id: status.id }
      expect(response).to redirect_to admin_statuses_path
    end
  end

  describe "#update_all" do
    let(:status1) { create(:status_example) }
    let(:status2) { create(:status_example) }

    it "update the statuses." do
      expect(status1.name).to eq "MyString"
      expect(status2.name).to eq "MyString"

      post :update_all, status: { status1.id.to_s => { name: "A" }, status2.id.to_s => { name: "B" }}
      expect(status1.reload.name).to eq "A"
      expect(status2.reload.name).to eq "B"
    end
  end
end
