step 'access the :page page.' do |page|
  case page
    when 'HOME' then visit root_path
    when 'BLOG' then visit blogs_path
  end
end

step 'access the :menu menu.' do |menu|
  within ".header ul.nav > li.menu.#{menu.downcase}" do
    click_link menu
  end
end
