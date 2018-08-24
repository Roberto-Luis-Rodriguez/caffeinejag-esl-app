module AuthenticationHelpers
  def sign_in_as!(teacher)
    visit '/sign_in'
    fill_in 'Email', :with => teacher.email
    fill_in 'Password', :with => "secret"
    click_button 'Sign in'
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, :type => :requests
end
