FactoryGirl.define do
  factory :blog_example, class: Blog do
    title "Title1"
    contents1 "Contents1"
    contents2 "Contents2"
    created_at "2013/08/01 08:00:00"
    posted_at "2013/08/01 09:00:00"
    draft false
  end
end
