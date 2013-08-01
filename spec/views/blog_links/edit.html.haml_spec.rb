require 'spec_helper'

describe "blog_links/edit" do
  before(:each) do
    @blog_link = assign(:blog_link, stub_model(BlogLink,
      :title => "MyString",
      :author => "MyString",
      :introduction => "MyString",
      :url => "MyString",
      :position => 1,
      :draft => false
    ))
  end

  it "renders the edit blog_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blog_link_path(@blog_link), "post" do
      assert_select "input#blog_link_title[name=?]", "blog_link[title]"
      assert_select "input#blog_link_author[name=?]", "blog_link[author]"
      assert_select "input#blog_link_introduction[name=?]", "blog_link[introduction]"
      assert_select "input#blog_link_url[name=?]", "blog_link[url]"
      assert_select "input#blog_link_position[name=?]", "blog_link[position]"
      assert_select "input#blog_link_draft[name=?]", "blog_link[draft]"
    end
  end
end
