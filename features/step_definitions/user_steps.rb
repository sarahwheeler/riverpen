require_relative '../spec_helper'


#   LOGGING IN

Then(/^a user is created$/) do
   @user = FactoryGirl.create(:user)
   @user.save!
   @user.should_not eq nil
end

Given(/^I am logged in/) do
  steps %{
    Given I visit the home page             
    And I click the "Sign Up!" link                                   
    Then a "sign up" modal should appear                              
    When I fill in "Your Email Address" 
    And I fill in "Pick a Username:"      
    And I fill in "Signup Password"   
    And I fill in "Confirm Password"      
    Then I click the "Sign Up" button                               
    And a user is created
  }
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