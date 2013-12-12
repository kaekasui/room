# encoding: utf-8

step 'there is a blog.' do
  @blog = create(:blog_example)
end

step 'there are :items_count blogs.' do |items_count|
  items_count.to_i.times { create(:blog_example) }
end

step 'display the :page page of blogs list.' do |page|
  visit blogs_path(page: page)
end

step 'display the :blogs_count blogs on the list.' do |blogs_count|
  expect(page).to have_selector("table.table > tr > th.post_at", count: blogs_count)
end

step 'access to the blog.' do
  click_link @blog.title
end

step 'display the blog title.' do
  expect(page).to have_selector(".table tr > th > a", @blog.title)
end

step 'display the blog contents1.' do
  expect(page).to have_selector(".table tr > td.contents1", @blog.contents1)
end

step 'display the blog contents2.' do
  expect(page).to have_selector(".table tr > td.contents1", @blog.contents2)
end
