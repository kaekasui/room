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

step 'コメントフォームのテキストフィールド :item に値を入力する' do |item|
  fill_in item, with: "Item"
end

step 'コメントフォームのテキストフィールド :item に値を入力しない' do |item|
  # 何もしない
end

step 'コメントフォームのテキストエリア :item に値を入力する' do |item|
  fill_in item, with: "Item"
end

step 'コメントフォームのテキストエリア :item に値を入力しない' do |item|
  # 何もしない
end

step 'コメントフォームの :button ボタンをクリックする' do |button|
  click_button button
end

step 'コメントが :counts 件表示される' do |counts|
  expect(page).to have_selector("div.blog_comment", count: counts)
#  expect(Blog.first.blog_comments.count).to eq 1
end

step 'コメントが登録されず表示されない' do
  expect(page).to have_selector("div.blog_comment", count: 0)
end
