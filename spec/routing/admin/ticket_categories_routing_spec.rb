require "spec_helper"

describe Admin::TicketCategoriesController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/ticket_categories").to route_to("admin/ticket_categories#index")
    end

    it "no route matches #show." do
      expect(get "admin/ticket_categories/1").not_to route_to("admin/ticket_categories#show")
    end

    it "no route matches #new." do
      expect(get "admin/ticket_categories/new").not_to route_to("admin/ticket_categories#new")
    end

    it "no route matches #create." do
      expect(post "admin/ticket_categories").not_to route_to("admin/ticket_categories#create")
    end

    it "no route matches #edit." do
      expect(get "admin/ticket_categories/1/edit").not_to route_to("admin/ticket_categories#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "admin/ticket_categories/1").not_to route_to("admin/ticket_categories#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/ticket_categories/1").to route_to("admin/ticket_categories#destroy", id: "1")
    end

    it "routes to #update_all." do
      expect(post "admin/ticket_categories/update_all").to route_to("admin/ticket_categories#update_all")
    end
  end
end
