require 'spec_helper'

describe "blog_comments/edit" do
  before(:each) do
    @blog_comment = assign(:blog_comment, stub_model(BlogComment,
      :blog_id => 1,
      :title => "MyString",
      :author => "MyString",
      :content => "MyText",
      :url => "MyString",
      :mail => "MyString",
      :ip => "MyString",
      :host => "MyString",
      :password => "MyString",
      :salt => "MyString",
      :admin => false,
      :mixi => false,
      :draft => false
    ))
  end

  it "renders the edit blog_comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blog_comment_path(@blog_comment), "post" do
      assert_select "input#blog_comment_blog_id[name=?]", "blog_comment[blog_id]"
      assert_select "input#blog_comment_title[name=?]", "blog_comment[title]"
      assert_select "input#blog_comment_author[name=?]", "blog_comment[author]"
      assert_select "textarea#blog_comment_content[name=?]", "blog_comment[content]"
      assert_select "input#blog_comment_url[name=?]", "blog_comment[url]"
      assert_select "input#blog_comment_mail[name=?]", "blog_comment[mail]"
      assert_select "input#blog_comment_ip[name=?]", "blog_comment[ip]"
      assert_select "input#blog_comment_host[name=?]", "blog_comment[host]"
      assert_select "input#blog_comment_password[name=?]", "blog_comment[password]"
      assert_select "input#blog_comment_salt[name=?]", "blog_comment[salt]"
      assert_select "input#blog_comment_admin[name=?]", "blog_comment[admin]"
      assert_select "input#blog_comment_mixi[name=?]", "blog_comment[mixi]"
      assert_select "input#blog_comment_draft[name=?]", "blog_comment[draft]"
    end
  end
end
