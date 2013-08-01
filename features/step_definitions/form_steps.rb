#!/bin/env ruby
# encoding: utf-8

もし(/^テキストエリア"(.*?)"に"(.*?)"を入力する$/) do |text_area, text|
  fill_in "mail_form_content", with: text
end

ならば(/^テキストエリアが表示される$/) do
  page.should have_selector(".sidebar-nav textarea[id=mail_form_content]")
end

ならば(/^ボタン"(.*?)"が表示される$/) do |value|
  page.should have_selector(".sidebar-nav input.btn[value=#{value}]")
end

もし(/^ボタン"(.*?)"をクリックする$/) do |button|
  click_button button
end

ならば(/^メッセージ"(.*?)"が表示される$/) do |message|
  page.should have_selector(".sidebar-nav div.alert", text: message)
end
