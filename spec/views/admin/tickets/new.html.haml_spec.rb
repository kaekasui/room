require 'spec_helper'

describe "tickets/new" do
=begin
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :code => 1,
      :title => "MyString",
      :content => "MyText",
      :progress => 1,
      :status_id => 1,
      :priority_id => 1,
      :version_id => 1,
      :user_id => 1,
      :created_by => 1
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tickets_path, "post" do
      assert_select "input#ticket_code[name=?]", "ticket[code]"
      assert_select "input#ticket_title[name=?]", "ticket[title]"
      assert_select "textarea#ticket_content[name=?]", "ticket[content]"
      assert_select "input#ticket_progress[name=?]", "ticket[progress]"
      assert_select "input#ticket_status_id[name=?]", "ticket[status_id]"
      assert_select "input#ticket_priority_id[name=?]", "ticket[priority_id]"
      assert_select "input#ticket_version_id[name=?]", "ticket[version_id]"
      assert_select "input#ticket_user_id[name=?]", "ticket[user_id]"
      assert_select "input#ticket_created_by[name=?]", "ticket[created_by]"
    end
  end
=end
end
