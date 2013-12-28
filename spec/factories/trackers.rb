# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tracker_example, class: Tracker do
    name "MyString"
    position 1
  end
end
