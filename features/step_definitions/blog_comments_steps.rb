#!/bin/env ruby
# encoding: utf-8

前提(/^ブログのコメントが"(.*?)"件である場合$/) do |blog_comments_count|
  blog_comments_count.to_i.times do |count|
    @blog_comments = BlogComment.create(author: "Author", content: "Content", ip: "172.0.0.1", blog_id: @blog.id)
  end
end

ならば(/^最近のコメントが"(.*?)"件表示される$/) do |display_count|
  page.should have_selector(".sidebar-nav > ul.sidebar_blog_comments > li", count: display_count)
end
