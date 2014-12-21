Feature: User has a profile 
	
	Scenario: A new user signs up and an empty profile is created. 
		Given I visit the home page
		And I click the "Sign Up!" link
		Then a "sign up" modal should appear
		When I enter "wonderwoman@themyscira.gov" for "Email Address"
		And I enter "grrlpower" for "Password"
		And I enter "grrlpower" for "Confirm Password"
		Then I click the "Sign Up" button
		And a user profile should be created