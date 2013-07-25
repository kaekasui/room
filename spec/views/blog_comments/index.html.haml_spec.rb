require 'spec_helper'

describe "blog_comments/index" do
  before(:each) do
    assign(:blog_comments, [
      stub_model(BlogComment,
        :blog_id => 1,
        :title => "Title",
        :author => "Author",
        :content => "MyText",
        :url => "Url",
        :mail => "Mail",
        :ip => "Ip",
        :host => "Host",
        :password => "Password",
        :salt => "Salt",
        :admin => false,
        :mixi => false,
        :draft => false
      ),
      stub_model(BlogComment,
        :blog_id => 1,
        :title => "Title",
        :author => "Author",
        :content => "MyText",
        :url => "Url",
        :mail => "Mail",
        :ip => "Ip",
        :host => "Host",
        :password => "Password",
        :salt => "Salt",
        :admin => false,
        :mixi => false,
        :draft => false
      )
    ])
  end

  it "renders a list of blog_comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Mail".to_s, :count => 2
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
    assert_select "tr>td", :text => "Host".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Salt".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
