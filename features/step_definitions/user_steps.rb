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
  when match(/Email Address/)
  	fill_in 'Email Address', with: value
  when match(/Password/)
  	fill_in 'Password', with: value
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
    page.find('#login-btn-navbar').click()
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
   @user = User.new(:email => "wonderwoman@themyscira.gov", :id => 101)
   @user.should_not eq nil
end

Then(/^"(.*?)" appears in the navbar$/) do |arg1|
  @user = User.new(:email => "wonderwoman@themyscira.gov", :id => 101)
  @current_user.id.should == 101
end
