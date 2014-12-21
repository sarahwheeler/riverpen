Feature: User has a profile 
	
	Scenario: A new user signs up and an empty profile is created. 
		Given I do not have an account
		And I click the "Sign Up" button
		Then a "sign up" modal should appear
		


