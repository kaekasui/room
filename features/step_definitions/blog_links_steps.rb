#!/bin/env ruby
# encoding: utf-8

前提(/^ブログのリンクが"(.*?)"件である場合$/) do |links_count|
  links_count.to_i.times do
    BlogLink.create(title: "Title", author: "Author", url: "https://#")
  end
end

ならば(/^リンクが"(.*?)"件表示される$/) do |display_count|
  page.should have_selector(".sidebar-nav > ul.sidebar_blog_links > li", count: display_count)
end
