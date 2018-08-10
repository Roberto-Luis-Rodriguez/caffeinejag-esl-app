require 'rails_helper'
#
feature 'Spec for Sign in', %q(
As an unauthenticated teacher
I want to sign in
So that I can see, upload and/or
delete my lesson plans,
flashcards, videos and worksheets
) do
#
# #Acceptance Criteria
# # If I input a registered email and password -> I sign in
# # If I input an unregistered email and password or
# # wrong email and/or password -> I can't sign in
# # If I am already signed in -> I can't again sign in
#
# def setup
#   @teacher = teachers(:roberto)
# end

scenario 'an existing teacher specifies a valid email and password' do
   teacher = FactoryBot.create(:teacher)
   visit sign_in_path
   fill_in "Email", with: teacher.email
   fill_in "Password", with: teacher.password
	 fill_in "Confirmation", with: teacher.password
   click_button "Sign in"
   # expect(page).to have_content "Welcome to the CaffeineJag Esl App!"
 end
end

 # scenario 'a non-existent email and password is supplied' do
 #   user = FactoryBot.create(:user)
 #   visit new_user_session_path
 #   fill_in "Email", with: user.email
 #   fill_in "Password", with: user.password
 #   click_button "Sign in"
 #   expect(page).to have_content ""
   # expect(page).to_not have_content ""
 # end

 # scenario 'an existing email with the wrong password is denied access' do
 #  user = FactoryBot.create(:user)
 #  visit new_user_session_path
 #  fill_in "Email", with: user.email
 #  fill_in "Password", with: 'incorrectPassword'
 #  click_button "Sign in"
 #  expect(page).to have_content ""
 # expect(page).to_not have_content ""
 # end

 # scenario 'an already authenticated user cannot re-sign in' do
 #   user = FactoryBot.create(:user)
 #   visit new_user_session_path
 #   fill_in "Email", with: user.email
 #   fill_in "Password", with: user.password
 #   click_button "Sign in"
 #   expect(page).to have_content "Sign Out"
 #   expect(page).to_not have_content "Sign In"
 # end
# end

# previous code below
# describe "Spec for Sign in" do
# scenario "teacher successfully signs in" do
# 	visit sign_in_path
# 	email = "abcd@example.com"
# 	fill_in 'Email', :with => email
# 	fill_in 'Password', :with => "password"
# 	fill_in 'Confirmation', :with => "password"
# 	click_button 'Sign in'
	# expect(page).to have_content "Welcome to the CaffeineJag Esl App!"
  # end

  # scenario "teacher unsuccessfully signs in" do
  # 	visit sign_in_path
  # 	email = " "
  # 	fill_in 'Email', :with => email
  # 	fill_in 'Password', :with => "password"
  # 	fill_in 'Confirmation', :with => "password"
  # 	click_button 'Sign in'
  # 	expect(page).to_not have_content "Welcome to the CaffeineJag Esl App!"
  #   expect(page).to have_content('Invalid email/password combination')
  #   end
# end
