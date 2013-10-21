# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status do
    name "MyString"
    position 1
    deleted_at "2013-10-22 01:23:53"
  end
end
