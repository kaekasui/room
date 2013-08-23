require 'spec_helper'

describe "admin/blogs/new" do
  before do
    @blog = Blog.new
  end

  describe "ブログの作成フォーム" do
    it "タイトルが表示されること" do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: Blog.human_attribute_name(:title))
    end

    it "内容1が表示されること" do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: Blog.human_attribute_name(:contents1))
    end

    it "内容2が表示されること" do
      render
      expect(rendered).to have_selector("form > div.control-group > label", content: Blog.human_attribute_name(:contents2))
    end
  end 
end
