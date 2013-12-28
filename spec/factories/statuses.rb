# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status_example, class: Status do
    name "MyString"
    position 1
  end
end
