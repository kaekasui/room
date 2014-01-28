require "spec_helper"

describe Admin::TicketVersionsController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/ticket_versions").to route_to("admin/ticket_versions#index")
    end

    it "no route matches #show." do
      expect(get "admin/ticket_versions/1").not_to route_to("admin/ticket_versions#show")
    end

    it "routes to #new." do
      expect(get "admin/ticket_versions/new").to route_to("admin/ticket_versions#new")
    end

    it "routes to #create." do
      expect(post "admin/ticket_versions").to route_to("admin/ticket_versions#create")
    end

    it "no route matches #edit." do
      expect(get "admin/ticket_versions/1/edit").not_to route_to("admin/ticket_versions#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "admin/ticket_versions/1").not_to route_to("admin/ticket_versions#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/ticket_versions/1").to route_to("admin/ticket_versions#destroy", id: "1")
    end

    it "routes to #update_all." do
      expect(post "admin/ticket_versions/update_all").to route_to("admin/ticket_versions#update_all")
    end
  end
end
