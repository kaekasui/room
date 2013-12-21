step 'display the introduction.' do
  expect(page).to have_selector("div.introduction", I18n.t("home.introduction"))
end
