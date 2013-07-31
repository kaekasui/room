require "spec_helper"

describe "HOME" do
  describe "routing" do

    it "トップページが表示されること" do
      expect(get("/")).to route_to("home#index")
    end
  end
end
