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
    contents1 "Contents1"
    created_at "2013/08/02 08:00:00"
    draft false
  end

  factory :draft_blog, class: Blog do
    title "Title3"
    contents1 "Contents1"
    created_at "2013/08/03 08:00:00"
    draft true
  end

  factory :blog_with_no_title, class: Blog do
    title ""
    contents1 "Contents1"
    created_at "2013/08/04 08:00:00"
    draft false
  end

  factory :blog_with_no_contents1, class: Blog do
    title "Title"
    contents1 ""
    created_at "2013/08/05 08:00:00"
    draft false
  end

end
