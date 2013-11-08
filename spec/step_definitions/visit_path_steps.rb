# encoding: utf-8

step ':page 画面を表示している' do |page|
  case page
    when "HOME" then visit root_path
  end
end
