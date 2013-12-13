# encoding: utf-8
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


