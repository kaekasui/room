require 'spec_helper'

describe "functions/new" do
  before(:each) do
    assign(:function, stub_model(Function,
      :name => "MyString",
      :position => 1
    ).as_new_record)
  end

  it "renders new function form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", functions_path, "post" do
      assert_select "input#function_name[name=?]", "function[name]"
      assert_select "input#function_position[name=?]", "function[position]"
    end
  end
end
