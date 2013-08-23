# encoding: utf-8

step '管理画面のブログの作成画面を表示している' do
  visit new_admin_blog_path
end

step 'ブログの投稿日時の値を選択する' do
  select "2013", from: "blog_created_at_1i"
  select "9", from: "blog_created_at_2i"
  select "1", from: "blog_created_at_3i"
  select "09", from: "blog_created_at_4i"
  select "00", from: "blog_created_at_5i"
  select "00", from: "blog_created_at_6i"
end

step 'ブログのテキストフィールド :item に値を入力する' do |item|
  fill_in item, with: "Item"
end

step 'ブログのテキストフィールド :item に値を入力しない' do |item|
  # 何もしない
end

step 'ブログのテキストエリア :item に値を入力する' do |item|
  fill_in item, with: "Item"
end

step 'ブログのテキストエリア :item に値を入力しない' do |item|
  # 何もしない
end

step ':button ボタンをクリックする' do |button|
  click_button button
end

step ':message メッセージが表示される' do |message|
  expect(page).to have_selector("div.alert-success", text: message)
end

step 'エラーメッセージが表示される' do
  expect(page).to have_css(".alert")
end

step '管理画面のブログ一覧にブログが :count 件表示される' do |count|
  expect(page).to have_selector("table.table td.post_at", count: count)
end
