FactoryGirl.define do
  factory :blog, class: Blog do
    title "Title1"
    contents1 "Contents1"
    contents2 "Contents2"
    created_at "2013/08/01 08:00:00"
    draft false
  end

  factory :latest_blog, class: Blog do
    title "Title2"
    created_at "2013/08/02 08:00:00"
    draft false
  end

  factory :draft_blog, class: Blog do
    title "Title3"
    created_at "2013/08/03 08:00:00"
    draft true
  end
end
