require "spec_helper"

describe Admin::BlogCategoriesController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/blog_categories").to route_to("admin/blog_categories#index")
    end

    it "no route matches #show." do
      expect(get "admin/blog_categories/1").not_to route_to("admin/blog_categories#show")
    end

    it "no route matches #new." do
      expect(get "admin/blog_categories/new").not_to route_to("admin/blog_categories#new")
    end

    it "no route matches #create." do
      expect(post "admin/blog_categories").not_to route_to("admin/blog_categories#create")
    end

    it "no route matches #edit." do
      expect(get "admin/blog_categories/1/edit").not_to route_to("admin/blog_categories#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "admin/blog_categories/1").not_to route_to("admin/blog_categories#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/blog_categories/1").to route_to("admin/blog_categories#destroy", id: "1")
    end

    it "routes to #update_all." do
      expect(post "admin/blog_categories/update_all").to route_to("admin/blog_categories#update_all")
    end
  end
end
