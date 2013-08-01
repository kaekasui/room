require "spec_helper"

describe BlogLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/blog_links").should route_to("blog_links#index")
    end

    it "routes to #new" do
      get("/blog_links/new").should route_to("blog_links#new")
    end

    it "routes to #show" do
      get("/blog_links/1").should route_to("blog_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/blog_links/1/edit").should route_to("blog_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blog_links").should route_to("blog_links#create")
    end

    it "routes to #update" do
      put("/blog_links/1").should route_to("blog_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blog_links/1").should route_to("blog_links#destroy", :id => "1")
    end

  end
end
