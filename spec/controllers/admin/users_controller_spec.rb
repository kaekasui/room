require 'spec_helper'

describe Admin::UsersController do
  let(:user1) { create(:user_example, admin:true) }
  before do
    sign_in user1
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
    let(:user) { create(:user_example) }

    it "is success." do
      delete :destroy, { id: user.id }
      expect(response.status).to eq 302
    end

    it "update the 'deleted_at'." do
      expect(user.deleted_at).to be_nil
      delete :destroy, { id: user.id }
      expect(user.reload.deleted_at).not_to be_nil
    end

    it "redirect to :index" do
      delete :destroy, { id: user.id }
      expect(response).to redirect_to admin_users_path
    end
  end

  describe "#update_all" do
    let(:user2) { create(:user_example, email: "user2@example.com") }
    let(:user3) { create(:user_example, email: "user3@example.com") }

    it "update the users." do
      expect(user2.email).to eq "user2@example.com"
      expect(user3.email).to eq "user3@example.com"

      post :update_all, user: { user1.id.to_s => { admin: 1, screen_name: "name", provider: "twitter"}, user2.id.to_s => { admin: 1, screen_name: "name2", provider: "twitter"}, user3.id.to_s => { admin: 0, screen_name: "name3", provider: "" }}
      expect(user2.reload.screen_name).to eq "name2"
      expect(user3.reload.screen_name).to eq "name3"
    end
  end
end
