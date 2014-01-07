# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :categorization do
    registrable_id 1
    registrable_type "MyString"
    category_id 1
  end
end
