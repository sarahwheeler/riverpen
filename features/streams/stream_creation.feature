Feature: User can create and view streams
	So that they can write their thoughts, deep and shallow
	And share them with others
	And be multifaceted people
	And give the site content

	Scenario: User creates a stream
		Given I am logged in
		Given show me the page
		And I click the "+Stream" link
		Then I should see the "Create a Stream" page
		When I select "Tech" from "Category"
		And I select "Public" from "Visibility"
		And I click the "Create Stream" button
		Then a new stream is created

	Scenario: User views their streams
		Given I am logged in


	Scenario: User deletes a stream
		Given I am logged in 


