require "spec_helper"

describe "User" do
  describe "routing" do
    it "display the sign up page." do
      expect(get("/users/sign_up")).to route_to("users/registrations#new")
    end

    it "display the edit profile page." do
      pending
      user = create(:user_example)
      expect(get("/users/#{user.id}/edit")).to route_to("users/registrations#edit", id: user.id.to_s)
    end
  end
end
