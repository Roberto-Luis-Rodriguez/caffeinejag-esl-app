require 'rails_helper'

feature 'Spec for Sign Up',  %{As a teacher
# I want to create an account
# So that I can upload lesson plans,
flashcards, videos and worksheets
} do

# Acceptance Criteria
# I must specify a valid email address
# I must specify a password and confirm that password
# If I don't peform the above, I get an error message
# If I specify valid informnation, I register my account and am authenticated

scenario "teacher successfully creates an account" do
	visit sign_up_path
  name = "Anthing"
	email = "abcd@example.com"
  fill_in 'teacher_name', :with => name
	fill_in 'teacher_email', :with => email
	fill_in 'teacher_password', :with => "password"
	fill_in 'teacher_password_confirmation', :with => "password"
	click_button 'Sign up'
	expect(page).to have_content "Welcome to the CaffeineJag Esl App!"
  end

  scenario "teacher unsuccessfully creates an account" do
  	visit sign_up_path
    name = " "
  	email = "abcd@example.com"
    fill_in 'teacher_name', :with => name
  	fill_in 'teacher_email', :with => email
  	fill_in 'teacher_password', :with => "password"
  	fill_in 'teacher_password_confirmation', :with => "password"
  	click_button 'Sign up'
  	expect(page).to_not have_content "Welcome to the CaffeineJag Esl App!"
    expect(page).to have_content('Name can\'t be blank')
    end
end
