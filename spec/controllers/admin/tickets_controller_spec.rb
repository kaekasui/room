require 'spec_helper'

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
    administrator = create(:original_user_example, admin: true)
    sign_in administrator
  end

  describe "#index" do
    it "is success." do
      get :index
      expect(response.status).to eq 200
    end

    it "access the tickets list page." do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#show" do
    it "is success." do
      get :show, id: ticket.id
      expect(response.status).to eq 200
    end

    it "access the detailed ticket page." do
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

  describe "#create" do
    context "when data is normal" do
      it "is success." do
        expect { post :create, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id } } }.to change(Ticket, :count).by(1)
      end
    end

    context "when title is blank" do
      it "cannot a ticket." do
        expect { post :create, { ticket: { title: "", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id } } }.to change(Ticket, :count).by(0)
      end
    end

    context "when there is a ticket category" do
      it "regist the ticket categories." do
        ticket_category = create(:ticket_category_example)
        expect { post :create, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, ticket_categories: [ticket_category.id.to_s] } }.to change(Ticket, :count).by(1)
        expect { post :create, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, ticket_categories: [ticket_category.id.to_s] } }.to change(TicketCategoryCase, :count).by(1)
      end
    end

    context "when there are two ticket categories" do
      it "regist the ticket categories." do
        ticket_category1 = create(:ticket_category_example)
	ticket_category2 = create(:ticket_category_example, name: "Name")
        expect { post :create, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, ticket_categories: [ticket_category1.id.to_s, ticket_category2.id.to_s] } }.to change(Ticket, :count).by(1)
        expect { post :create, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, ticket_categories: [ticket_category1.id.to_s, ticket_category2.id.to_s] } }.to change(TicketCategoryCase, :count).by(2)
      end
    end
  end

  describe "#update" do
    context "when data is normal" do
      it "is success." do
        ticket = create(:ticket_example, project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id)
	expect(ticket.title).not_to eq "Title"
        patch :update, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, id: ticket.id }
        expect(ticket.reload.title).to eq "Title"
      end
    end

    context "when title is blank" do
      it "cannot a ticket." do
        ticket = create(:ticket_example, project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id)
	expect(ticket.title).to eq "MyString"
        patch :update, { ticket: { title: "", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, id: ticket.id }
        expect(ticket.reload.title).to eq "MyString"
      end
    end

    context "when there is a ticket category" do
      it "regist the ticket categories." do
        ticket_category1 = create(:ticket_category_example)
	ticket_category2 = create(:ticket_category_example, name: "Name")
        ticket = create(:ticket_example, project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id)
	ticket_category_case = create(:ticket_category_case_example, ticket_id: ticket.id, ticket_category_id: ticket_category1.id)

        expect(ticket_category_case.ticket_category_id).to eq ticket_category1.id
        expect { patch :update, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, ticket_categories: [ticket_category2.id.to_s], id: ticket.id } }.to change(Ticket, :count).by(0)
        expect { patch :update, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, ticket_categories: [ticket_category2.id.to_s], id: ticket.id } }.to change(TicketCategoryCase, :count).by(0)
	#expect(ticket_category_case.reload.ticket_category_id).to eq ticket_category2.id
	expect(ticket.ticket_category_cases.reload.first.ticket_category.id).to eq ticket_category2.id
      end
    end

    context "when there are two ticket categories" do
      it "regist the ticket categories." do
        ticket = create(:ticket_example, project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id)
        ticket_category1 = create(:ticket_category_example)
	ticket_category2 = create(:ticket_category_example, name: "Name")

        expect { patch :update, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, ticket_categories: [ticket_category1.id.to_s, ticket_category2.id.to_s], id: ticket.id } }.to change(TicketCategoryCase, :count).by(2)
        expect { patch :update, { ticket: { title: "Title", project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id }, ticket_categories: [ticket_category1.id.to_s, ticket_category2.id.to_s], id: ticket.id } }.to change(Ticket, :count).by(0)
	expect(ticket.ticket_category_cases.count).to eq 2
      end
    end
  end

  describe "#destroy" do
    it "is success." do
      ticket = create(:ticket_example, project_id: project.id, version_id: version.id, status_id: status.id, priority_id: priority.id, tracker_id: tracker.id, created_by: user.id)
      expect(ticket.deleted_at).to eq nil
      delete :destroy, { id: ticket.id }
      expect(ticket.reload.deleted_at).not_to eq nil
    end
  end

  after do
    sign_out :user
  end
end
