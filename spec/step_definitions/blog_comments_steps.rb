# encoding: utf-8
step 'there are :count comments.' do |count|
  count.to_i.times { create(:blog_comment_example, blog_id: @blog.id) }
end

step 'display :count comments on the blog page.' do |count|
  expect(page).to have_selector(".blog_comment", count: count)
end

step 'display the blog comment form.' do
  expect(page).to have_selector("form#new_blog_comment")
end

step 'fill in item to the text field :item .' do |item|
  fill_in I18n.t("activerecord.attributes.blog_comment.#{item}"), with: "Item"
end

step 'don\'t fill in item to the text field :item .' do |item|
  # nothing
end

step 'fill in item to the text area :item .' do |item|
  fill_in I18n.t("activerecord.attributes.blog_comment.#{item}"), with: "Item"
end

step 'don\'t fill in item to the text area :item .' do |item|
  # nothing
end

step 'click the button :button .' do |button|
  click_button I18n.t("helpers.submit.#{button}")
end

step 'post the blog comment.' do
  expect(@blog.blog_comments.count).to eq 1
end

step 'don\'t post the blog comment.' do
  expect(@blog.blog_comments.count).to eq 0
end

step 'display a blog comment.' do
  expect(page).to have_selector(".blog_comment", count: 1)
end

step 'don\'t display a blog comment.' do
  expect(page).to have_selector(".blog_comment", count: 0)
end
