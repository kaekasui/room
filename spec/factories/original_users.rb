FactoryGirl.define do
  factory :original_user_example, class: OriginalUser do
    email "original_user@example.com"
    password "password"
    password_confirmation "password"
    admin false
  end
end
