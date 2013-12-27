require 'spec_helper'

# ログインの有無については、別のテストにて行うことにする
describe Admin::TicketsController do
  let(:project) { create(:project_example) }
  let(:user) { create(:user_example) }
  let(:version) { create(:version_example) }
  let(:priority) { create(:priority_example) }
  let(:status) { create(:status_example) }
  let(:tracker) { create(:tracker_example) }
  let(:ticket) { create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id) }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    controller.stub(:authenticate_user!).and_return true
  end

  context "with non-logged-in user" do
    describe "#index" do
      it "is success." do
        get :index
        expect(response.status).to eq 302
      end

      it "access the home page." do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end

    describe "#show" do
      it "is success." do
        get :show, id: ticket.id
	expect(response.status).to eq 302
      end

      it "access the home page." do
        get :show, id: ticket.id
	expect(response).to redirect_to(root_path)
      end
    end
  end

  context "with logged-in user." do
    before do
      user = create(:original_user_example)
      sign_in user
    end

    describe "#index" do
      it "is success." do
        get :index
        expect(response.status).to eq 302
      end

      it "access :index" do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end

    describe "#show" do
      it "is success." do
        get :show, id: ticket.id
	expect(response.status).to eq 302
      end

      it "access the home page." do
        get :show, id: ticket.id
	expect(response).to redirect_to(root_path)
      end
    end

    after do
      sign_out :user
    end
  end

  context "with logged-in administrator." do
    before do
      administrator = create(:original_user_example, admin: true)
      sign_in administrator
    end

    describe "#index" do
      it "is success." do
        get :index
        expect(response.status).to eq 200
      end

      it "access the admin page." do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "#show" do
      it "is success." do
        get :show, id: ticket.id
	expect(response.status).to eq 200
      end

      it "access the ticket page." do
        get :show, id: ticket.id
	expect(response).to render_template(:show)
      end
    end

    describe "#new" do
      it "is success." do
        get :new
	expect(response.status).to eq 200
      end

      it "access the new ticket page." do
        get :new
	expect(response).to render_template(:new)
      end
    end

    describe "#edit" do
      it "is success." do
        get :edit, id: ticket.id
	expect(response.status).to eq 200
      end

      it "access the edit ticket page." do
        get :edit, id: ticket.id
	expect(response).to render_template(:edit)
      end
    end

    after do
      sign_out :user
    end
  end
end
