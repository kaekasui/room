# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "MyString"
    uid "MyString"
    name "MyString"
    screen_name "MyString"
    image "MyString"
    email "test@sample.com"
  end
end
