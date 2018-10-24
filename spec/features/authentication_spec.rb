# require 'rails_helper'
#
# feature 'Spec for Sign out', %q(
# As signed in teacher
# I want to sign out of my account
# ) do
#
# Given /^a teacher visits the sign_in page$/ do
#   visit sign_in_path
# end
#
# When /^they submit invalid sign_in information$/ do
#   click_button "Sign in"
# end
#
# Then /^they should see an error message$/ do
#   expect(page).to have_selector('div.alert.alert-error')
# end
#
# Given /^the teacher has an account$/ do
#   @teacher = Teacher.create(name: "Example Teacher", email: "teacher@example.com",
#                       password: "foobar", password_confirmation: "foobar")
# end
#
# When /^the teacher submits valid sign_in information$/ do
#   fill_in "Email",    with: @teacher.email
#   fill_in "Password", with: @teacher.password
#   click_button "Sign in"
# end
#
# Then /^they should see their profile page$/ do
#   expect(page).to have_title(@teacher.name)
# end
#
# Then /^they should see a sign_out link$/ do
#   expect(page).to have_link('Sign out', href: sign_out_path)
# end
