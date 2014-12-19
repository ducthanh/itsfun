Feature: Wrong password confirm verification
	As a user
	When ordering an item
	I want to make sure that the product details page and cart page displays accordingly
Background: 
	Given open the home page
Scenario: Verify that an error message is display when a user signup but don't input confirmation
	And searching for an existing product
	And open the product details page
	When add the product into cart
	Then the product name and price in cart are display properly