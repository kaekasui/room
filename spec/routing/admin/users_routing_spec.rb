require "spec_helper"

describe Admin::UsersController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/users").to route_to("admin/users#index")
    end

    it "no route matches #show." do
      expect(get "admin/users/1").not_to route_to("admin/users#show")
    end

    it "no route matches #new." do
      expect(get "admin/users/new").not_to route_to("admin/users#new")
    end

    it "no route matches #create." do
      expect(post "admin/users").not_to route_to("admin/users#create")
    end

    it "no route matches #edit." do
      expect(get "admin/users/1/edit").not_to route_to("admin/users#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "admin/users/1").not_to route_to("admin/user#update", id: "1")
    end

    it "routes to #destroy." do
      user = create(:user_example)
      expect(delete "admin/users/1").to route_to("admin/users#destroy", id: "1")
    end

    it "routes to #update_all." do
      expect(post "admin/users/update_all").to route_to("admin/users#update_all")
    end
  end
end
