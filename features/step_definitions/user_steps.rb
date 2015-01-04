require_relative '../spec_helper'

Given(/^I visit the home page$/) do
  visit root_path
end

Given(/^I click the "(.*?)" link$/) do |link_text|
	click_link(link_text)
end

Then(/^a "(.*?)" modal should appear$/) do |modal_kind|
  case modal_kind
  when match(/sign up/)
    page.should have_selector('.in')
  when match(/login/)
    page.should have_selector('.in')
  else
    raise StandardError, "No modal defined for '#{modal_kind}' in test."
  end
end

When(/^I enter "(.*?)" for "(.*?)"$/) do |value, field_name|
  case field_name
  # Sign Up Modal
  when match(/Your Email Address/)
    fill_in 'email-signup', with: value, :match => :prefer_exact
  # Sign Up Modal
  when match(/Pick a Username:/)
    within('.signup-modal') do
      fill_in 'username-signup', with: value
    end
  # Sign Up Modal
  when match(/Signup Password/)
  	fill_in 'pw-signup', with: value, :match => :prefer_exact
  # Sign Up Modal
  when match(/Confirm Password/)
    fill_in "Confirm Password", with: value
  # Login Modal
  when match(/Login/)
    within('.login-modal') do 
      fill_in 'user_login', with: value, :match => :prefer_exact
    end
  # Login Modal
  when match(/Password/)
    fill_in 'pw-login', with: value, :match => :prefer_exact
  else 
  	raise StandardError, "No field name #{field_name}"
  end
end

Then(/^I click the "(.*?)" button$/) do |button_name|
  case button_name
  when match(/Sign Up/)
  	page.find('#signup-submit').click()
  when match(/Log in/)
    click_link('Log in')
  when match(/Login/)
    within('.login-modal') do
      page.find('#login-submit').click()
    end
  else 
  	raise StandardError, "No field name #{field_name}"
  end
end

Then(/^a user profile should be created$/) do
  @user = FactoryGirl.create(:user)
  @user.build_profile
  @user.profile.user_id.should_not eq nil
end

Then(/^a user is created$/) do
   @user = FactoryGirl.create(:user)
   @user.should_not eq nil
end

Given(/^I log in as an existing user$/) do
  @user = FactoryGirl.create(:user)
  click_link('Log in')
  within find(".login-modal") do
    fill_in 'Login', with: @user.username
    fill_in 'pw-login', with: @user.password
  end
  click_button 'Log in'
end

When(/^I wait "(.*?)" seconds$/) do |seconds|
  sleep (seconds.to_i + 0.01)
end

Then(/^Log out appears in the navbar$/) do  
  within find('.alert') do
    page.should have_text('Signed in successfully.')
  end
end

Given(/^show me the page$/) do
  save_and_open_page
end

Given(/^I click the Account dropdown$/) do
  click_link('.dropdown-toggle')
end