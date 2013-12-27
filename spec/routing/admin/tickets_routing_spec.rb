require "spec_helper"

describe Admin::TicketsController do
  describe "routing" do
    let(:project) { create(:project_example) }
    let(:user) { create(:user_example) }
    let(:version) { create(:version_example) }
    let(:priority) { create(:priority_example) }
    let(:status) { create(:status_example) }
    let(:tracker) { create(:tracker_example) }
    let(:ticket) { create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id) }

    it "display the tickets list." do
      expect(get("/admin/tickets")).to route_to("admin/tickets#index")
    end

    it "display the detail of ticket." do
      expect(get("/admin/tickets/#{ticket.id}")).to route_to("admin/tickets#show", id: ticket.id.to_s)
    end

    it "display the ticket new page." do
      expect(get("/admin/tickets/#{ticket.id}/edit")).to route_to("admin/tickets#edit", id: ticket.id.to_s)
    end

    it "display the ticket edit page." do
      expect(get("/admin/tickets/#{ticket.id}/edit")).to route_to("admin/tickets#edit", id: ticket.id.to_s)
    end
  end
end
