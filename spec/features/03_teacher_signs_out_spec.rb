require 'rails_helper'

feature 'Spec for Sign out', %q(
As a signed in teacher
I want to sign out of my account
) do
#
#   # # Acceptance Criteria
#   # # As an already signed in authenticated teacher
#   # # I want to be able to see the sign out link to click on
#   # # Which will lead to me signing out of my profile on the site
#   # # And lead me back to either signing in or signing up on the index page

let!(:teacher) { FactoryBot.create(:teacher, email: "anything@example.com", password: "1234567") }

scenario 'a signed in teacher signs out of account' do
    signed_in?(teacher)
    visit sign_in_path
    fill_in "Email", with: teacher.email
    fill_in "Password", with: teacher.password
    click_button "Sign in"
    click link("Sign out", visible: false, href: sign_out_path)
    visit root_path
    end
  end

# # previous code below
# teacher = FactoryBot.create(:teacher)
