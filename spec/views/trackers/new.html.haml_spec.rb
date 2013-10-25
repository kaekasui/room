require 'spec_helper'

describe "trackers/new" do
  before(:each) do
    assign(:tracker, stub_model(Tracker,
      :name => "MyString",
      :position => 1
    ).as_new_record)
  end

  it "renders new tracker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trackers_path, "post" do
      assert_select "input#tracker_name[name=?]", "tracker[name]"
      assert_select "input#tracker_position[name=?]", "tracker[position]"
    end
  end
end
