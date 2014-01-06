require "spec_helper"

describe BlogsController do
  describe "routing" do
    it "routes to #index." do
      expect(get "/blogs").to route_to("blogs#index")
    end

    it "routes to #show." do
      expect(get "/blogs/1").to route_to("blogs#show", id: "1")
    end

    it "no route matches #new." do
      expect(get "/blogs/new").not_to route_to("blogs#new")
    end

    it "no route matches #create." do
      expect(post "blogs").not_to route_to("blogs#create")
    end

    it "no route matches #edit." do
      expect(get "/blogs/1/edit").not_to route_to("blogs#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "blogs/1").not_to route_to("blogs#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "blogs/1").not_to route_to("blogs#destroy", id: "1")
    end
  end
end
