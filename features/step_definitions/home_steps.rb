#!/bin/env ruby
# encoding: utf-8

ならば(/^紹介文が表示される$/) do
  page.should have_selector("div.introduction", I18n.t("home.introduction"))
end
