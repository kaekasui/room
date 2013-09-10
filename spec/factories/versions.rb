# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :version do
    name "MyString"
    used false
    current false
    deleted_at "2013-09-10 14:08:17"
  end
end
