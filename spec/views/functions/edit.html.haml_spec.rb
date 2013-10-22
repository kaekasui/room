require 'spec_helper'

describe "functions/edit" do
  before(:each) do
    @function = assign(:function, stub_model(Function,
      :name => "MyString",
      :position => 1
    ))
  end

  it "renders the edit function form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", function_path(@function), "post" do
      assert_select "input#function_name[name=?]", "function[name]"
      assert_select "input#function_position[name=?]", "function[position]"
    end
  end
end
