require 'spec_helper'

describe "tickets/index" do
=begin
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :code => 1,
        :title => "Title",
        :content => "MyText",
        :progress => 2,
        :status_id => 3,
        :priority_id => 4,
        :version_id => 5,
        :user_id => 6,
        :created_by => 7
      ),
      stub_model(Ticket,
        :code => 1,
        :title => "Title",
        :content => "MyText",
        :progress => 2,
        :status_id => 3,
        :priority_id => 4,
        :version_id => 5,
        :user_id => 6,
        :created_by => 7
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
=end
end
