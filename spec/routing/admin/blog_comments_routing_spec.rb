require "spec_helper"

describe Admin::BlogCommentsController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/blog_comments").to route_to("admin/blog_comments#index")
    end

    it "no route matches #show." do
      expect(get "admin/blog_comments/1").not_to route_to("admin/blog_comments#show", id: "1")
    end

    it "no route matches #new." do
      expect(get "admin/blogs_comment/new").not_to route_to("admin/blog_comments#new")
    end

    it "no route matches #create." do
      expect(post "admin/blog_comments").not_to route_to("admin/blog_comments#create")
    end

    it "no route matches #edit." do
      expect(get "admin/blog_comments/1/edit").not_to route_to("admin/blog_comments#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "admin/blog_comments/1").not_to route_to("admin/blog_comments#update", id: "1")
    end

    it "routes to #destroy." do
      expect(delete "admin/blog_comments/1").to route_to("admin/blog_comments#destroy", id: "1")
    end
  end
end
