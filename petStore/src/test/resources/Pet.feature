@regression
Feature: Testing Pet API Calls
Background:
	* url url
	* print url
	
Scenario: Add a new pet
Given path 'v2/pet'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request read('classpath:addPet.json')
When method POST
Then status 200

Given path 'v2/pet'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request ''
When method POST
Then status 405

Given path 'v2/pet'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request read('classpath:addPetWrongData.json')
When method POST
Then status 500
	
Scenario: Upload Pet image
Given path 'v2/pet/1/uploadImage'
And multipart file file = { read: 'dog.jpg', filename: 'upload-name.jpg', contentType: 'image/jpg' }
And header api-key = 'special-key'
When method POST
Then status 200
	
Scenario: Update a pet
Given path 'v2/pet'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request read('classpath:updatePet.json')
When method PUT
Then status 200

Given path 'v2/pet'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
And request ''
When method PUT
Then status 405

Scenario: Get pets by status
Given path 'v2/pet/findByStatus'
And header Content-Type = 'application/json'
And param status = 'avaialble,pending' 
And header api-key = 'special-key'
When method GET
Then status 200

Scenario: Get pet by ID
Given path 'v2/pet/1'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method GET
Then status 200
And match response.id == 1

Given path 'v2/pet/av'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method GET
Then status 404

Scenario: Delete a Pet
Given path 'v2/pet/1'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method DELETE
Then status 200

Given path 'v2/pet/av'
And header Content-Type = 'application/json'
And header api-key = 'special-key'
When method DELETE
Then status 404