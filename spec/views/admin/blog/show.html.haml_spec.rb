require 'spec_helper'

describe "admin/blogs/new" do
  before do
    @blog = Blog.new
  end

  describe "blog form" do
    it "display the title." do
      render
      expect(rendered).to have_selector("form > div.form-group > label", content: Blog.human_attribute_name(:title))
    end

    it "display the content1." do
      render
      expect(rendered).to have_selector("form > div.form-group > label", content: Blog.human_attribute_name(:contents1))
    end

    it "display the content2." do
      render
      expect(rendered).to have_selector("form > div.form-group > label", content: Blog.human_attribute_name(:contents2))
    end
  end 
end
