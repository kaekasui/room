require 'spec_helper'

describe "trackers/edit" do
=begin
  before(:each) do
    @tracker = assign(:tracker, stub_model(Tracker,
      :name => "MyString",
      :position => 1
    ))
  end

  it "renders the edit tracker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tracker_path(@tracker), "post" do
      assert_select "input#tracker_name[name=?]", "tracker[name]"
      assert_select "input#tracker_position[name=?]", "tracker[position]"
    end
  end
=end
end
