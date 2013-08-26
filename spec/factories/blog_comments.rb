FactoryGirl.define do
  factory :blog_comment, class: BlogComment do
    title "Title1"
    author "Author"
    content "Content"
    created_at "2013/08/01 08:00:00"
    draft false
  end

  factory :expective_blog_comment, class: BlogComment do
    title ""
    author ""
    content ""
    created_at "2013/08/01 08:00:00"
    draft false
  end
end
