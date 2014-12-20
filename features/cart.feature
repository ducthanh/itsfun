Feature: Cart
	Verifying the cart information, quantity
Background: 
	Given I open the home page
Scenario: Verify that the subtotal is update properly when changing the number of quantity
	Given I search for a product then adding that item into cart
	And once the cart pop-up is enable change the number of the quantity
	Then the subtotal is update accordingly
Scenario: Verify that the subtotal updates properly when changing the number of quantity in the Cart that have some items
	Given I add some items into cart
	And I change the quantity for an item
	Then the subtotal of all product is update accordingly
Scenario: Verify that an error message is display when a user signup but don't input confirmation
	And I search for an existing product
	And I open the product details page
	When I add the product into cart
	Then the product name and product price in cart are display properly