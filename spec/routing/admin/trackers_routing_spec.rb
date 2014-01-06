require "spec_helper"

describe Admin::TrackersController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/trackers").to route_to("admin/trackers#index")
    end

    it "no route matches #show." do
      expect(get "admin/trackers/1").not_to route_to("admin/trackers#show")
    end

    it "no route matches #new." do
      expect(get "admin/trackers/new").not_to route_to("admin/trackers#new")
    end

    it "no route matches #create." do
      expect(post "admin/trackers").not_to route_to("admin/trackers#create")
    end

    it "no route matches #edit." do
      expect(get "admin/trackers/1/edit").not_to route_to("admin/trackers#edit", id: "1")
    end

    it "no route matches #update." do
      tracker = create(:tracker_example)
      expect(patch "admin/trackers/1").not_to route_to("admin/trackers#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/trackers/1").to route_to("admin/trackers#destroy", id: "1")
    end

    it "routes to #update_all." do
      expect(post "admin/trackers/update_all").to route_to("admin/trackers#update_all")
    end
  end
end
