Feature: User has a profile 
	So that users can create identify themselves
	And learn about others
	And make friends
	
	Scenario: An empty profile is created at signup. 
		Given I visit the home page
		And I click the "Sign Up!" link
		Then a "sign up" modal should appear
		When I fill in "Your Email Address"
		And I fill in "Pick a Username"
		And I fill in "Signup Password"
		And I fill in "Confirm Password"
		Then I click the "Sign Up" button
		And a user profile should be created

	Scenario: User edits their profile.
		Given I am logged in
		And I click the "Profile" link
		Then I should see the "Profile" page
		When I click the "Edit" button
		Then I should see the "Edit Profile" page
		And I fill in "Name"
		And I fill in "Age"
		And I fill in "Location"
		And I fill in "Website"
		And I fill in "Bio"
		And I click the "Update Profile" button
		Then I should see the "Profile" page
		And I see "Princess Diana" as my profile "name"
		And I see "23" as my profile "age"
		And I see "Themyscira, Amazon" as my profile "location"
		And I see "http://www.dccomics.com/characters/wonder-woman" as my profile "website"
		And I see "Using jewelry as deadly weapons since 1941." as my profile "bio"

	Scenario: User deletes profile.
		Given I am logged in
		And I click the "Settings" link
		Then I should see the "Settings" page
		When I click the "Cancel my account" button
		And I confirm the alert
		Then my account should be deleted
		And my profile should be deleted
