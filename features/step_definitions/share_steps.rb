#!/bin/env ruby
# encoding: utf-8

もし(/^"(.*?)"ページを表示する$/) do |page_name|
  visit path_to(page_name)
end

ならば(/^サイドメニュー"(.*?)"が表示される$/) do |menu|
  page.should have_selector(".sidebar-nav > h4", text: menu)
end

ならば(/^プロフィールに"(.*?)"が表示される$/) do |profile|
  page.should have_selector(".sidebar-nav > ul.nav-list > li", text: profile)
end
