require 'spec_helper'

describe "blog_links/index" do
  before(:each) do
    assign(:blog_links, [
      stub_model(BlogLink,
        :title => "Title",
        :author => "Author",
        :introduction => "Introduction",
        :url => "Url",
        :position => 1,
        :draft => false
      ),
      stub_model(BlogLink,
        :title => "Title",
        :author => "Author",
        :introduction => "Introduction",
        :url => "Url",
        :position => 1,
        :draft => false
      )
    ])
  end

  it "renders a list of blog_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Introduction".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
