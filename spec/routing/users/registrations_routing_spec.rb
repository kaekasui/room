require "spec_helper"

describe Users::RegistrationsController do
  describe "routing" do
    it "routes to #new." do
      expect(get "/users/sign_up").to route_to("users/registrations#new")
    end

    it "routes to #show." do
      expect(get '/users/profile').to route_to('users/registrations#show')
    end
  end
end
