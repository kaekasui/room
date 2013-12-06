# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :version_example, class: Version do
    name "MyString"
    used false
    current false
  end
end
