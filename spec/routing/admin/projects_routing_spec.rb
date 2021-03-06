require "spec_helper"

describe Admin::ProjectsController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/projects").to route_to("admin/projects#index")
    end

    it "no route matches #show." do
      expect(get "admin/projects/1").not_to route_to("admin/projects#show")
    end

    it "routes to #new." do
      expect(get "admin/projects/new").to route_to("admin/projects#new")
    end

    it "routes to #create." do
      expect(post "admin/projects").to route_to("admin/projects#create")
    end

    it "routes to #edit." do
      expect(get "admin/projects/1/edit").to route_to("admin/projects#edit", id: "1")
    end

    it "routes to #update." do
      expect(patch "admin/projects/1").to route_to("admin/projects#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/projects/1").to route_to("admin/projects#destroy", id: "1")
    end

    it "routes to #update_all." do
      expect(post "admin/projects/update_all").to route_to("admin/projects#update_all")
    end
  end
end
