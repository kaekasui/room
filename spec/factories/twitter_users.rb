FactoryGirl.define do
  factory :twitter_user_example, class: TwitterUser do
    email nil
    provider "twitter"
    uid 215862345
    name "名前"
    screen_name "表示名"
    password "password"
    admin false
  end
end
