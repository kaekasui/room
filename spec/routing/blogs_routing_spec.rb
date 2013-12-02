require "spec_helper"

describe "BLOG" do
  describe "routing" do
    it "display the blogs list." do
      expect(get("/blogs")).to route_to("blogs#index")
    end

    it "display the detail of blog." do
      @blog = create(:blog_example)
      expect(get("/blogs/#{@blog.id}")).to route_to("blogs#show", id: @blog.id.to_s)
    end
  end
end
