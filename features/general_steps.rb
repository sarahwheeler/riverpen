require_relative 'spec_helper'

#   HELPERS

Given(/^show me the page$/) do
  save_and_open_page
end

When(/^I wait "(.*?)" seconds$/) do |seconds|
  sleep (seconds.to_i + 0.01)
end


#   BASIC NAVIGATING

Given(/^I visit the home page$/) do
  visit root_path
end

Given(/^I click the "(.*?)" link$/) do |link|
  case link
  when match(/Profile/)  
    within('div.dropdown') do
     page.find('span.caret').click()
     click_link('Profile')
    end
  when match(/Settings/)
    within('div.dropdown') do
      page.find('span.caret').click()
      click_link('Settings')
    end
  else
	 click_link(link)
  end
end

Then(/^I click the "(.*?)" button$/) do |button_name|
  case button_name
  # Nav Bar
  when match(/Sign Up/)
  	page.find('#signup-submit').click()
  when match(/Log in/)
    click_link('Log in')
  when match(/Login/)
    within('.login-modal') do
      page.find('#login-submit').click()
    end
  # Edit Profile
  when match(/Edit/)
    page.find('.btn').click()
  when match(/Update Profile/)
    click_button('Update Profile')
  # Settings
  when match(/Cancel my account/)
    click_button('Cancel my account')
  else 
  	raise StandardError, "No field name #{field_name}"
  end
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

Then(/^I should see the "(.*?)" page$/) do |page_name|
  case page_name
  when match(/Edit Profile/)
    has_content?("Profile")
  when match(/Profile/)
    has_content?("Profile")
  when match(/Settings/)
    has_content?(/Account Settings/)
  when match(/Create a Stream/)
    has_content?(/Create a Stream/)
  else
    raise StandardError, "No page named #{page_name}"
  end
end

When(/^I confirm the alert$/) do
  page.evaluate_script('window.confirm')
end


#   BASIC FORMS

When(/^I enter "(.*?)" for "(.*?)"$/) do |value, field_name|
  case field_name
  # Sign Up Modal
  when match(/Your Email Address/)
    fill_in 'email-signup', with: value, :match => :prefer_exact
  when match(/Pick a Username:/)
    within('.signup-modal') do
      fill_in 'username-signup', with: value
    end
  when match(/Signup Password/)
  	fill_in 'pw-signup', with: value, :match => :prefer_exact
  when match(/Confirm Password/)
    fill_in "Confirm Password", with: value
  # Login Modal
  when match(/Login/)
    within('.login-modal') do 
      fill_in 'user_login', with: value, :match => :prefer_exact
    end
  when match(/Password/)
    fill_in 'pw-login', with: value, :match => :prefer_exact
  # Edit Profile
  when match(/Name/)
    fill_in 'Name', with: value
  when match(/Age/)
    select('23', from: 'profile-age-field')
  when match(/Location/)
    fill_in 'Location', with: value
  when match(/Website/)
    fill_in 'Website', with: value
  when match(/Bio/)
    fill_in 'Bio', with: value
  else 
  	raise StandardError, "No field name #{field_name}"
  end
end

When(/^I select "(.*?)" from "(.*?)"$/) do |option, dropdown|
  case dropdown
  when match(/Category/)
    select option, from: dropdown
  when match(/Visibility/)
    select option, from: dropdown
  else
    raise StandardError, "Please define #{dropdown} in the step_definitions file."
  end
end








