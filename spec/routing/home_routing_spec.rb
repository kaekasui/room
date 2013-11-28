require "spec_helper"

describe "HOME" do
  describe "routing" do
    it "display the top page." do
      expect(get("/")).to route_to("home#index")
    end
  end
end
