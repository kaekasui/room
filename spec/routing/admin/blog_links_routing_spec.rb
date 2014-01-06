require "spec_helper"

describe Admin::BlogLinksController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/blog_links").to route_to("admin/blog_links#index")
    end

    it "no route matches #show." do
      expect(get "admin/blog_links").not_to route_to("admin/blog_links#show")
    end

    it "no route matches #new." do
      expect(get "admin/blog_links/new").not_to route_to("admin/blog_links#new")
    end

    it "no route matches #create." do
      expect(post "admin/blog_links").not_to route_to("admin/blog_links#create")
    end

    it "routes to #edit." do
      expect(get "admin/blog_links/1/edit").to route_to("admin/blog_links#edit", id: "1")
    end

    it "routes to #update." do
      expect(patch "admin/blog_links/1").to route_to("admin/blog_links#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/blog_links/1").to route_to("admin/blog_links#destroy", id: "1")
    end

    it "routes to #update_all." do
      expect(post "admin/blog_links/update_all").to route_to("admin/blog_links#update_all")
    end
  end
end
