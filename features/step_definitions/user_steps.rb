Given(/^I visit the home page$/) do
  visit root_path
end

Given(/^I click the "(.*?)" link$/) do |link_text|
	click_link(link_text)
end

Then(/^a "(.*?)" modal should appear$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I enter "(.*?)" for "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I click the "(.*?)" button$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^a user profile should be created$/) do
  pending # express the regexp above with the code you wish you had
end