#!/bin/env ruby
# encoding: utf-8

前提(/^ブログの記事が"(.*?)"件である場合$/) do |blogs_count|
  blogs_count.to_i.times do |count|
    @blog = Blog.create(title: "Title" + (count + 1).to_s, contents1: "Content1")
  end
end

もし(/^ブログ詳細ページを表示する$/) do
  visit blog_path(@blog)
end

もし(/^ブログ一覧ページの"(.*?)"ページ目を表示する$/) do |page|
  visit blogs_path(page: page)
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
