# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :priority_example, class: Priority do
    name "MyString"
    position 1
  end
end
