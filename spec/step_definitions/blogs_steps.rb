# encoding: utf-8

step 'ブログの記事が :blogs 件登録されている' do |blogs|
  blogs.to_i.times do |c|
    FactoryGirl.create(:blog)
  end
end

step 'ブログ一覧ページの :page ページ目が表示されている' do |page|
  visit blogs_path(page: page)
end

step 'ブログの記事が :count 件表示される' do |count|
  expect(page).to have_selector("table.table > tr > th.post_at", count: count)
end

step 'ブログの記事の詳細画面が表示されている' do
  visit blog_path(Blog.first)
end

=begin 
step 'ブログ詳細ページを表示する' do
  visit blog_path(@blog)
end

ならば(/^ブログの記事が"(.*?)"件表示される$/) do |display_count|
p display_count
  page.should have_selector("table.table > tr > th.post_at", count: display_count)
end

ならば(/^最近の記事が"(.*?)"件表示される$/) do |display_count|
  page.should have_selector("div.well > ul.nav > li > a.recent_blog", count: display_count)
end

ならば(/^ブログのタイトルが表示される$/) do
  page.should have_selector(".table tr > th > a", @blog.title)
end

ならば(/^ブログの投稿日付が表示される$/) do
  page.should have_selector(".table tr > th.post_at", @blog.created_at)
end

ならば(/^ブログのコンテンツ1が表示される$/) do
  page.should have_selector(".table tr > td.contents1", @blog.contents1)
end

ならば(/^ブログのコンテンツ2が表示される$/) do
  page.should have_selector(".table tr > td.contents2", @blog.contents2)
end
=end
