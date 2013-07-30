#!/bin/env ruby
# encoding: utf-8

もし(/^"(.*?)"ページを表示する$/) do |page_name|
  visit path_to(page_name)
end
