Feature: Product quantity
	As a user I want to change the quantity of products
	I expected that the cart update accordingly for the quatity changing
Background: 
	Given open the home page
Scenario: Verify that the subtotal is update properly when changing the number of quantity
	Given searching for a product then adding that item into cart
	And once the cart pop-up is enable change the number of the quantity
	Then the subtotal is update accordingly
Scenario: Verify that the subtotal updates properly when changing the number of quantity in the Cart that have some items
	Given adding some items into cart
	And changing the quantity for an item
	Then the subtotal of all product is update accordingly