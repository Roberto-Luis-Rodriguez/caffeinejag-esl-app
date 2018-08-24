require 'rails_helper'

feature 'Spec for Updating Account', %q(
  As an authenticated user
  I want to update my information
  So that I can keep it up to date
) do

#Acceptance Criteria
# Already signed in, I want to click on "Account"
# Which will lead me to my account information for me to update
# After updating, I will be able to save
# And if I am missing any information the update will not be saved

scenario 'a signed in teacher signs out of account' do
  teacher = FactoryBot.create(:teacher)
  visit '/teachers/:id/edit'
  # fill_in 'Name', :with => teacher.name
  # fill_in 'Email', :with => teacher.email
  # fill_in 'Password', :with => "password"
  # fill_in 'Password confirmation', :with => "password"
  # click_button 'Save changes'

  end
end
