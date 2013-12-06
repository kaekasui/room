step 'display the introduction.' do
  expect(page).to have_selector("div.introduction", I18n.t("home.introduction"))
end

step 'display the :menu on the side menu.' do |menu|
  expect(page).to have_selector("div.sidebar-nav > h4", text: I18n.t("side_menu.#{menu}"))
end

step 'display the My Account on the navigation bar.' do
  expect(page).to have_selector("div.header a.dropdown-toggle", text: "My Account")
end

step 'don\'t display the My Account on the navigation bar.' do
  expect(page).not_to have_selector("div.header a.dropdown-toggle", text: "My Account")
end

step 'display the admin menu on the navigation bar.' do
  expect(page).to have_selector("div.header li.dropdown > a.dropdown-toggle", text: I18n.t("menu.admin"))
end

step 'don\'t display the admin menu on the navigation bar.' do
  expect(page).not_to have_selector("div.header li.dropdown > a.dropdown-toggle", text: I18n.t("menu.admin"))
end
