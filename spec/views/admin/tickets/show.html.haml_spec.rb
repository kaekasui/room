require 'spec_helper'

describe "tickets/show" do
=begin
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :code => 1,
      :title => "Title",
      :content => "MyText",
      :progress => 2,
      :status_id => 3,
      :priority_id => 4,
      :version_id => 5,
      :user_id => 6,
      :created_by => 7
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
  end
=end
end
