# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    code 1
    title "MyString"
    content "MyText"
    progress 1
    status_id 1
    priority_id 1
    version_id 1
    user_id 1
    created_by 1
    deleted_at "2013-10-22 13:57:21"
  end
end
