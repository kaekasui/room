require 'spec_helper'

describe "blogs/index" do
  before(:each) do
    assign(:blogs, [
      stub_model(Blog,
        :title => "Title",
        :blog_category_code => "Blog Category Code",
        :contents1 => "MyText",
        :contents2 => "MyText",
        :draft => false
      ),
      stub_model(Blog,
        :title => "Title",
        :blog_category_code => "Blog Category Code",
        :contents1 => "MyText",
        :contents2 => "MyText",
        :draft => false
      )
    ])
  end

  it "renders a list of blogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Blog Category Code".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
