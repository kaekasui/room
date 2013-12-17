### on the side menu ###
step 'display the :menu on the side menu.' do |menu|
  expect(page).to have_selector("div.sidebar-nav > h4", text: I18n.t("side_menu.#{menu}"))
end

### on the navigation bar ###
step 'display the :menu on the navigation bar.' do |menu|
  expect(page).to have_selector("div.header li.menu > a", text: menu)
end

step 'display the admin menu on the navigation bar.' do
  expect(page).to have_selector("div.header li.dropdown > a.dropdown-toggle", text: I18n.t("menu.admin"))
end

step 'don\'t display the admin menu on the navigation bar.' do
  expect(page).not_to have_selector("div.header li.dropdown > a.dropdown-toggle", text: I18n.t("menu.admin"))
end

step 'display the My Account on the navigation bar.' do
  expect(page).to have_selector("div.header a.dropdown-toggle", text: I18n.t("account.my_account"))
end

step 'don\'t display the My Account on the navigation bar.' do
  expect(page).not_to have_selector("div.header a.dropdown-toggle", text: "My Account")
end
