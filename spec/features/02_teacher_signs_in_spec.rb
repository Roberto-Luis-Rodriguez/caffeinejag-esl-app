# require 'rails_helper'

feature 'Spec for Sign in', %q(
As an unauthenticated teacher
I want to sign in to my account
So that I can see, upload and/or
delete my lesson plans,
flashcards, videos and worksheets
) do

# Acceptance Criteria
# If I input a registered email and password -> I sign in
# If I input an unregistered email and password or
# wrong email and/or password -> I can't sign in
# If I am already signed in -> I can't again sign in

scenario 'an existing teacher specifies a valid email and password' do
   teacher = FactoryBot.create(:teacher)
   visit sign_in_path
   fill_in "Email", with: teacher.email
   fill_in "Password", with: teacher.password
   click_button "Sign in"
   expect(page).to have_content "Welcome back to the CaffeineJag Esl App!"
 end

 scenario 'a non-existent email and/or password is supplied' do
   teacher = FactoryBot.create(:teacher)
   visit sign_in_path
   fill_in "Email", with: teacher.email
   fill_in "Password", with: " "
   click_button "Sign in"
   expect(page).to_not have_content "Welcome back to the CaffeineJag Esl App!"
  end
end
