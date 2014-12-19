Feature: Wrong password confirm verification
	As a user
	I sign up a new account
	I expect the verification for the password works properly
Background: 
	Given open the home page
Scenario: Verify that an error message is display when a user signup but don't input confirmation
	And sign up for the new account without inputting the confirm password
	Then error message for invalid sign up data display properly