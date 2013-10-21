require 'spec_helper'

describe "statuses/edit" do
  before(:each) do
    @status = assign(:status, stub_model(Status,
      :name => "MyString",
      :position => 1
    ))
  end

  it "renders the edit status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", status_path(@status), "post" do
      assert_select "input#status_name[name=?]", "status[name]"
      assert_select "input#status_position[name=?]", "status[position]"
    end
  end
end
