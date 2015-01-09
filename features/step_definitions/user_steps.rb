require_relative '../spec_helper'


#   LOGGING IN

Then(/^a user is created$/) do
   @user = FactoryGirl.create(:user)
   @user.should_not eq nil
end

Given(/^I am logged in/) do
  @user = FactoryGirl.create(:user)
  @user.save
  visit root_path
  click_link('Log in')
  within find(".login-modal") do
    fill_in 'Login', with: @user.username
    fill_in 'pw-login', with: @user.password
    sleep 1
    page.find('#login-submit').click()
    sleep 1
  end
  save_and_open_page
  within find('p.alert') do
    page.should have_text('Signed in successfully.')
  end
end

Then(/^Log out appears in the navbar$/) do  
  within find('.alert') do
    page.should have_text('Signed in successfully.')
  end
end

Then(/^my account should be deleted$/) do
  sleep(3)
  page.should have_text('Your account has been successfully cancelled.')
end


#   PROFILE ACTION

Then(/^a user profile should be created$/) do
  @user = FactoryGirl.create(:user)
  @user.build_profile
  @user.profile.user_id.should_not eq nil
end

Then(/^I see "(.*?)" as my profile "(.*?)"$/) do |value, field|
  has_content?(value)
end

Then(/^my profile should be deleted$/) do
  # Needs to be refactored in actually measuring the profile deletion--this
  # really just signs them out
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/users/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end