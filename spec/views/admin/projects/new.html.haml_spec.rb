require 'spec_helper'

describe "projects/new" do
=begin
  before(:each) do
    assign(:project, stub_model(Project,
      :title => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", projects_path, "post" do
      assert_select "input#project_title[name=?]", "project[title]"
      assert_select "textarea#project_content[name=?]", "project[content]"
    end
  end
=end
end
