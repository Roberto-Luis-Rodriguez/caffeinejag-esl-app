require 'rails_helper'

feature 'Spec for Sign out', %q(
As signed in teacher
I want to sign out of my account
) do

  # # Acceptance Criteria
  # # As an already signed in authenticated teacher
  # # I want to be able to see the sign out link to click on
  # # Which will lead to me signing out of my profile on the site
  # # And lead me back to either signing in or signing up on the index page

  scenario 'a signed in teacher signs out of account' do
    teacher = FactoryBot.create(:teacher)
    visit sign_in_path(as: teacher)

    # click_link 'Account'
    # fill_in 'Email', with: teacher.email
    # fill_in 'Password', with: teacher.password
    # click_button 'Sign out'

  end
end

# previous code below
