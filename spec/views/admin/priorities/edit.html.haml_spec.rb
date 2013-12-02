require 'spec_helper'

describe "priorities/edit" do
=begin
  before(:each) do
    @priority = assign(:priority, stub_model(Priority,
      :name => "MyString",
      :position => 1
    ))
  end

  it "renders the edit priority form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", priority_path(@priority), "post" do
      assert_select "input#priority_name[name=?]", "priority[name]"
      assert_select "input#priority_position[name=?]", "priority[position]"
    end
  end
=end
end
