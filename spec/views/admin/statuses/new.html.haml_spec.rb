require 'spec_helper'

describe "statuses/new" do
=begin
  before(:each) do
    assign(:status, stub_model(Status,
      :name => "MyString",
      :position => 1
    ).as_new_record)
  end

  it "renders new status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", statuses_path, "post" do
      assert_select "input#status_name[name=?]", "status[name]"
      assert_select "input#status_position[name=?]", "status[position]"
    end
  end
=end
end