require "spec_helper"

describe Admin::PrioritiesController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/priorities").to route_to("admin/priorities#index")
    end

    it "no route matches #show." do
      expect(get "admin/priorities/1").not_to route_to("admin/priorities#show")
    end

    it "no route matches #new." do
      expect(get "admin/priorities/new").not_to route_to("admin/priorities#new")
    end

    it "no route matches #create." do
      expect(post "admin/priorities").not_to route_to("admin/priorities#create")
    end

    it "no route matches #edit." do
      expect(get "admin/priorities/1/edit").not_to route_to("admin/priorities#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "admin/priorities/1").not_to route_to("admin/priorities#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/priorities/1").to route_to("admin/priorities#destroy", id: "1")
    end

    it "routes to #update_all." do
      expect(post "admin/priorities/update_all").to route_to("admin/priorities#update_all")
    end
  end
end
