
Feature: Shortcut based match Feature
  
  Scenario: A mobile user should
  be redirected to a mobile 
  related method when the route
  uses shortcuts
    Given I am a mobile user
    When I go to the shortcut page
    Then I should see "mobile"


  Scenario: A normal user should 
  be redirected to a original
  method in controller when the
  route uses shortcuts
    Given I am a normal user
    When I go to the shortcut page
    Then I should see "Normal User"


