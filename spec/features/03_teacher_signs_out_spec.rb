# require 'rails_helper'
#
# feature 'Spec for Sign out', %q(
# As an authenticated teacher
# I want to sign out of my account
# ) do
#
# # Acceptance Criteria
# # As an authenticated teacher already signed in
# # I want to be able to see the sign out link to click on
# # Which will lead to me signing out of my profile on the site
# # And lead me back to either signing in or signing up on the index page
#
# scenario 'an existing teacher signs out of account' do
#    teacher = FactoryBot.create(:teacher)
#    sign_in_as(teacher, :scope => :teacher)
#    visit root_path
#
#    # click_on 'Sign out'
#    #
#    # expect(page).to_not have_content('Sign out')
#    # expect(page).to have_content('Sign in')
#    # expect(page).to have_content('Sign up')
#   end
# end
