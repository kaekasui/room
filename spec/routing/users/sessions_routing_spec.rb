require "spec_helper"

describe Users::SessionsController do
  describe "routing" do
    it "routes to #new." do
      expect(get("/users/sign_in")).to route_to("users/sessions#new")
    end
  end
end
