@regression
Feature: Testing Order API Calls
Background:
	* url url
	* print url
	
Scenario: Place a new pet order
Given path 'v2/store/order'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request read('classpath:placeOrder.json')
When method POST
Then status 200

Given path 'v2/store/order'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request ''
When method POST
Then status 400

Scenario: Get Order by ID
Given path 'v2/store/order/1235'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method GET
Then status 404

Given path 'v2/store/order/av'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method GET
Then status 404

Scenario: Delete an Order
Given path 'v2/store/order/1252'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method DELETE
Then status 404

Given path 'v2/store/order/av'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method DELETE
Then status 404

Scenario: Get Store Inventory
Given path 'v2/store/inventory'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method GET
Then status 200