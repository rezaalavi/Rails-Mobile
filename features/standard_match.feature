
Feature: Standard Match Features


    Scenario: A mobile user should be
    redirected to a mobile related method
    in controller
    Given I am a mobile user
    When I GET the sinfo page
    Then I should see "Normal User"


    Scenario: A normal user should be 
    redirected to a original method
    in controller
    Given I am a normal user
    When I GET the sinfo page
    Then I should see "Normal User"


 Scenario: Mobile user to go to
parameterized match
Given I am a mobile user
When I GET the sphoto/1 page
Then I should see "normal 1"


Scenario: Normal user to go to
parameterized match
Given I am a normal user
When I GET the sphoto/1 page
Then I should see "normal 1"


Scenario: Mobile user to go to
constrains based route
Given I am a mobile user
When I GET the sp1/1 page
Then I should see "normal 1"


Scenario: Mobile user not to go to
constrains based route
Given I am a mobile user
When I GET the sp1/2 page
Then I should get a 404 status code


Scenario: Normal user to go to
constrains based route
Given I am a normal user
When I GET the sp1/1 page
Then I should see "normal 1"


Scenario: Normal user not to go to
constrains based route
Given I am a normal user
When I GET the sp1/2 page
Then I should get a 404 status code