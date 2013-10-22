require 'spec_helper'

describe "priorities/show" do
  before(:each) do
    @priority = assign(:priority, stub_model(Priority,
      :name => "Name",
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
