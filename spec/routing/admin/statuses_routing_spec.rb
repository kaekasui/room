require "spec_helper"

describe Admin::StatusesController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/statuses").to route_to("admin/statuses#index")
    end

    it "no route matches #show." do
      expect(get "admin/statuses/1").not_to route_to("admin/statuses#show")
    end

    it "no route matches #new." do
      expect(get "admin/statuses/new").not_to route_to("admin/statuses#new")
    end

    it "no route matches #create." do
      expect(post "admin/statuses").not_to route_to("admin/statuses#create")
    end

    it "no route matches #edit." do
      expect(get "admin/statuses/1/edit").not_to route_to("admin/statuses#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "admin/statuses/1").not_to route_to("admin/statuses#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/statuses/1").to route_to("admin/statuses#destroy", id: "1")
    end

    it "routes to #update_all." do
      expect(post "admin/statuses/update_all").to route_to("admin/statuses#update_all")
    end
  end
end
