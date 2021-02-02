@regression
Feature: Testing Order API Calls
Background:
	* url url
	* print url
	
Scenario: Create user with Array
Given path 'v2/user/createWithArray'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request read('classpath:createUserWithArray.json')
When method POST
Then status 200

Given path 'v2/user/createWithArray'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request ''
When method POST
Then status 405

Scenario: Create users with List
Given path 'v2/user/createWithList'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request read('classpath:createUserWithList.json')
When method POST
Then status 200

Given path 'v2/user/createWithList'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request ''
When method POST
Then status 405

Scenario: Get an user by userName
Given path 'v2/user/marshal'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method GET
Then status 200
And match response.username == "marshal"

Given path 'v2/user/av'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method GET
Then status 404

Scenario: Update an user
Given path 'v2/user/marshal'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request read('classpath:updateUser.json')
When method PUT
Then status 200

Scenario: Delete an User
Given path 'v2/user/marshal'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method DELETE
Then status 200

Given path 'v2/pet/av'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method DELETE
Then status 404

Scenario: Login to the sysytem
Given path 'v2/user/login'
And header Content-Type = 'application/json'
And param username = 'john'
And param password = 'john'
And header api-key = 'special-key'
When method GET
Then status 200

Scenario: Logout from the sysytem
Given path 'v2/user/logout'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method GET
Then status 200

Scenario: Create a new user
Given path 'v2/user'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request read('classpath:createUser.json')
When method POST
Then status 200