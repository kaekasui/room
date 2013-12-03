# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_example, class: User do
    email "user@example.com"
    password "password"
    admin false
  end
end
