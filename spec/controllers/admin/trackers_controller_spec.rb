require 'spec_helper'

describe Admin::TrackersController do
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
    let(:tracker) { create(:tracker_example) }

    it "is success." do
      delete :destroy, { id: tracker.id }
      expect(response.status).to eq 302
    end

    it "update the 'deleted_at'." do
      expect(tracker.deleted_at).to be_nil
      delete :destroy, { id: tracker.id }
      expect(tracker.reload.deleted_at).not_to be_nil
    end

    it "redirect to :index" do
      delete :destroy, { id: tracker.id }
      expect(response).to redirect_to admin_trackers_path
    end
  end

  describe "#update_all" do
    let(:tracker1) { create(:tracker_example) }
    let(:tracker2) { create(:tracker_example) }

    it "update the trackers." do
      expect(tracker1.name).to eq "MyString"
      expect(tracker2.name).to eq "MyString"

      post :update_all, tracker: { tracker1.id.to_s => { name: "A" }, tracker2.id.to_s => { name: "B" }}
      expect(tracker1.reload.name).to eq "A"
      expect(tracker2.reload.name).to eq "B"
    end
  end
end
