Feature: User can sign up and log in
	So that users can create accounts
	And make blog streams
	And make using the site worth their time
	
	Scenario: A new user signs up 
		Given I visit the home page
		And I click the "Sign Up!" link
		Then a "sign up" modal should appear
		When I fill in "Your Email Address"
		And I fill in "Pick a Username:"
		And I fill in "Signup Password"
		And I fill in "Confirm Password"
		Then I click the "Sign Up" button
		And a user is created

	Scenario: An existing user logs in.
		Given a user is created
		Given I visit the home page
		And I click the "Log in" button
		Then a "login" modal should appear
		When I fill in "Login"
		And I fill in "Password"
		Then I click the "Login" button
		When I wait "5" seconds
		And Log out appears in the navbar
