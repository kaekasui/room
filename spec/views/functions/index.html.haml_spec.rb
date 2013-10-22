require 'spec_helper'

describe "functions/index" do
  before(:each) do
    assign(:functions, [
      stub_model(Function,
        :name => "Name",
        :position => 1
      ),
      stub_model(Function,
        :name => "Name",
        :position => 1
      )
    ])
  end

  it "renders a list of functions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
