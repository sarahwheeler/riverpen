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
  when match(/Your Email Address/)
    fill_in 'email-signup', with: value, :match => :prefer_exact
  when match(/Signup Password/)
  	fill_in 'pw-signup', with: value, :match => :prefer_exact
  when match(/Email Address/)
    fill_in 'email-login', with: value, :match => :prefer_exact
  when match(/Pick a Username:/)
    within('.login-modal') do
      fill_in 'username-signup', with: value
    end
  when match(/Login Password/)
    fill_in 'pw-login', with: value, :match => :prefer_exact
  when match(/Confirm Password/)
  	fill_in "Confirm Password", with: value
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
    page.find('#login-submit').click()
  else 
  	raise StandardError, "No field name #{field_name}"
  end
end

Then(/^a user profile should be created$/) do
  @user = User.new(:email => "wonderwoman@themyscira.gov", :id => 101)
  @user.build_profile
  @user.profile.user_id.should_not eq nil
end

Then(/^a user is created$/) do
   @user = FactoryGirl.create(:wonderwoman)
   @user.should_not eq nil
end

Given /^an existing user$/ do
  u = FactoryGirl.create(:wonderwoman)
  u.save!
end

When(/^I wait "(.*?)" seconds$/) do |seconds|
  sleep (seconds.to_i + 0.01)
end

Then(/^Log out appears in the navbar$/) do  
  within find('.alert') do
    save_and_open_page
    page.should have_text('Signed in successfully.')
    save_and_open_page
  end
end

Given(/^show me the page$/) do
  save_and_open_page
end
