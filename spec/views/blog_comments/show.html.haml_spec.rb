require 'spec_helper'

describe "blog_comments/show" do
  before(:each) do
    @blog_comment = assign(:blog_comment, stub_model(BlogComment,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/Author/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/Mail/)
    rendered.should match(/Ip/)
    rendered.should match(/Host/)
    rendered.should match(/Password/)
    rendered.should match(/Salt/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
