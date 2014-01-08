require "spec_helper"

describe Users::RegistrationsController do
  describe "routing" do
    it "routes to #new." do
      expect(get "/users/sign_up").to route_to("users/registrations#new")
    end

=begin
    it "display the edit profile page." do
      pending
      user = create(:user_example)
      expect(get("/users/#{user.id}/edit")).to route_to("users/registrations#edit", id: user.id.to_s)
    end
=end
  end
end
