require "spec_helper"

describe "BLOG" do
  describe "routing" do
    it "ブログの一覧画面を表示する" do
      expect(get("/blogs")).to route_to("blogs#index")
    end

    it "ブログの詳細画面を表示する" do
      @blog = FactoryGirl.create(:blog)
      expect(get("/blogs/#{@blog.id}")).to route_to("blogs#show", id: @blog.id.to_s)
    end
  end
end
