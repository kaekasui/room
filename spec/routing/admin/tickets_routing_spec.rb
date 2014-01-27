require "spec_helper"

describe Admin::TicketsController do
  describe "routing" do
    it "routes to #index." do
      expect(get "/admin/tickets").to route_to("admin/tickets#index")
    end

    it "routes to #show." do
      expect(get "/admin/tickets/1").to route_to("admin/tickets#show", id: "1")
    end

    it "routes to #new." do
      expect(get "/admin/tickets/new").to route_to("admin/tickets#new")
    end

    it "routes to #create." do
      expect(post "/admin/tickets").to route_to("admin/tickets#create")
    end

    it "routes to #edit." do
      expect(get "/admin/tickets/1/edit").to route_to("admin/tickets#edit", id: "1")
    end

    it "routes to #update." do
      expect(patch "admin/tickets/1").to route_to("admin/tickets#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/tickets/1").to route_to("admin/tickets#destroy", id: "1")
    end

    it "routes to #set_tickets." do
      expect(post "admin/tickets/set_tickets").to route_to("admin/tickets#set_tickets")
    end
  end
end
