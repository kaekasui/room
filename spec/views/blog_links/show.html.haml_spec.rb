require 'spec_helper'

describe "blog_links/show" do
  before(:each) do
    @blog_link = assign(:blog_link, stub_model(BlogLink,
      :title => "Title",
      :author => "Author",
      :introduction => "Introduction",
      :url => "Url",
      :position => 1,
      :draft => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Author/)
    rendered.should match(/Introduction/)
    rendered.should match(/Url/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
