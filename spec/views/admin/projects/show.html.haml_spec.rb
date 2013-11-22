require 'spec_helper'

describe "projects/show" do
=begin
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
=end
end
