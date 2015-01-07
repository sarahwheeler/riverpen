Feature: User can create streams
	So that they can write their thoughts, deep and shallow
	And share them with others
	And be multifaceted people
	And give the site content

	Scenario: User creates a stream
		Given I am logged in
		And I click the "+Stream" link
		Then I should see the "Create a Stream" page
		And I select "Tech" from "Category"
