require 'spec_helper'

describe "projects/edit" do
=begin
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_path(@project), "post" do
      assert_select "input#project_title[name=?]", "project[title]"
      assert_select "textarea#project_content[name=?]", "project[content]"
    end
  end
=end
end
