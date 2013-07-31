#!/bin/env ruby
# encoding: utf-8

前提(/^ブログの記事が"(.*?)"件である場合$/) do |blogs_count|
  blogs_count.to_i.times do |count|
    @blog = Blog.create(title: "Title" + (count + 1).to_s, contents1: "Content1")
  end
end

もし(/^ブログ一覧ページの"(.*?)"ページ目を表示する$/) do |page|
  visit blogs_path(page: page)
end

ならば(/^ブログの記事が"(.*?)"件表示される$/) do |display_count|
  page.should have_selector(".table tr > th > a", count: display_count)
end
