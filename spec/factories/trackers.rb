# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tracker do
    name "MyString"
    position 1
    deleted_at "2013-10-25 21:45:12"
  end
end
