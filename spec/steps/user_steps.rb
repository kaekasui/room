step 'there is non-logged-in user.' do
  # nothing
end

step 'there is logged-in user.' do
  visit new_user_registration_path
  fill_in 'user_email', with: 'abc@example.com'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'
  click_button I18n.t("user.submit")
end

step 'there is logged-in administrator.' do
  visit new_user_registration_path
  fill_in 'user_email', with: 'abc@example.com'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'
  click_button I18n.t("user.submit")

  user = User.find_by_email('abc@example.com')
  user.admin = true
  user.save
  visit admin_blogs_path
end

step 'display the signed up message.' do
  expect(page).to have_selector("div.alert-success", text: I18n.t("devise.passwords.signed_up"))
end
