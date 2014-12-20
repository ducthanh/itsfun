Feature: Wrong password confirm verification
	As a user
	When ordering an item
	I want to make sure that the product details page and cart page displays accordingly
Background: 
	Given I open the home page
Scenario: Verify that an error message is display when a user signup but don't input confirmation
	And I search for an existing product
	And I open the product details page
	When I add the product into cart
	Then the product name and product price in cart are display properly