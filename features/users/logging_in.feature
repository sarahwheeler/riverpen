Feature: User can sign up and log in
	So that users can create accounts
	And make blog streams
	And make using the site worth their time
	
	Scenario: A new user signs up and a new User is created. 
		Given I visit the home page
		And I click the "Sign Up!" link
		Then a "sign up" modal should appear
		When I enter "wonderwoman@themyscira.gov" for "Email Address"
		And I enter "grrlpower" for "Password"
		And I enter "grrlpower" for "Confirm Password"
		Then I click the "Sign Up" button
		And a user is created

	Scenario: An existing user logs in.
		Given I visit the home page
		And I click the "Log in" button
		Then a "login" modal should appear
		When I enter "wonderwoman@themyscira.gov" for "Email Address"
		And I enter "grrlpower" for "Password"
		Then I click the "Login" button
		And "My Account" appears in the navbar
