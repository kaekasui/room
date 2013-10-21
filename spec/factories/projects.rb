# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title "MyString"
    content "MyText"
    deleted_at "2013-10-22 00:28:22"
  end
end
