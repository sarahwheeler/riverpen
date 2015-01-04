Feature: User has a profile 
	So that users can create identify themselves
	And learn about others
	And make friends
	
	Scenario: An empty profile is created at signup. 
		Given I visit the home page
		And I click the "Sign Up!" link
		Then a "sign up" modal should appear
		When I enter "wonderwoman@themyscira.gov" for "Your Email Address"
		And I enter "wonderwoman" for "Pick a Username:"
		And I enter "grrlpower" for "Signup Password"
		And I enter "grrlpower" for "Confirm Password"
		Then I click the "Sign Up" button
		And a user profile should be created

	Scenario: User edits their profile.
		Given I visit the home page
		And I log in as an existing user
		And I click the Account dropdown
		And I click the Profile link
		Then I should see the "Profile" page
		When I click the "Edit" button
		Then I am redirected to the "Edit Profile" page
		And I enter "Princess Diana" for "Name"
		And I enter "23" for "Age"
		And I enter "Themyscira, Amazon" for "Location"
		And I enter "http://www.dccomics.com/characters/wonder-woman" for "Website"
		And I enter "Using jewelry as deadly weapons since 1941." for "Bio"
		Then I am redirected to the "Profile" page
		And I see "Princess Diana" as my profile "name"
		And I see "23" as my profile "age"
		And I see "Themyscira, Amazon" as my profile "location"
		And I see "http://www.dccomics.com/characters/wonder-woman" as my profile "website"
		And I see "Using jewelry as deadly weapons since 1941." as my profile "bio"

