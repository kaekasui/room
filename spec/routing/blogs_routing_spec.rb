require "spec_helper"

describe "BLOG" do
  describe "routing" do

    it "ブログの一覧画面を表示する" do
      expect(get("/blogs")).to route_to("blogs#index")
    end
  end
end
