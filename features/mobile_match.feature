
Feature: Normal Match Features 
    
    Scenario: A mobile user should be
    redirected to a mobile related method
    in controller
    Given I am a mobile user
    When I go to the info page
    Then I should see "mobile"

    
    Scenario: A normal user should be 
    redirected to a original method
    in controller
    Given I am a normal user
    When I go to the info page
    Then I should see "Normal User"


 Scenario: A mobile user should go
    to a mobile only match
    Given I am a mobile user
    When I go to the mobile page
    Then I should see "mobile"


  Scenario: A normal user should not 
  go to a mobile only match

    Given I am a normal user
    When I go to the mobile page
    Then I should get a 404 status code



Scenario: Mobile user to go to
parameterized match
Given I am a mobile user
When I go to the photo/1 page
Then I should see "mobile 1"


Scenario: Normal user to go to
parameterized match
Given I am a normal user
When I go to the photo/1 page
Then I should see "normal 1"


Scenario: Mobile user to go to
constrains based route
Given I am a mobile user
When I go to the p1/1 page
Then I should see "mobile 1"


Scenario: Mobile user not to go to
constrains based route
Given I am a mobile user
When I go to the p1/2 page
Then I should get a ActionController::RoutingError Exception


Scenario: Normal user to go to
constrains based route
Given I am a normal user
When I go to the p1/1 page
Then I should see "normal 1"


Scenario: Normal user not to go to
constrains based route
Given I am a normal user
When I go to the p1/2 page
Then I should get a ActionController::RoutingError Exception