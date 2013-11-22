require 'spec_helper'

describe "trackers/index" do
=begin
  before(:each) do
    assign(:trackers, [
      stub_model(Tracker,
        :name => "Name",
        :position => 1
      ),
      stub_model(Tracker,
        :name => "Name",
        :position => 1
      )
    ])
  end

  it "renders a list of trackers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
=end
end
