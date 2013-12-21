### on the side menu ###
step 'display the :menu on the side menu.' do |menu|
  expect(page).to have_selector("div.sidebar-nav > h4", text: I18n.t("side_menu.#{menu}"))
end

### on the navigation bar ###
step 'display the :menu on the navigation bar.' do |menu|
  expect(page).to have_selector("div.header li.menu > a", text: menu)
end
