FactoryGirl.define do
  factory :ticket_example, class: Ticket do
    title "MyString"
    content "MyText"
    progress 0
  end
end
