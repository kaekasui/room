# encoding: utf-8

step 'ブログのコメントが :comments 件登録されている' do |comments|
  comments.to_i.times do |c|
    blog_comment = FactoryGirl.build(:blog_comment)
    blog_comment.blog_id = Blog.first.id
    blog_comment.save
  end
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
