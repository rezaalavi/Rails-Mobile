
Feature: Mobile User Feature
  

  Scenario: A mobile user should
  have mobile_device in params
    Given I am a mobile user
    When I go to the check page
    Then I should see "mobile"

  Scenario: A normal user doesn't
  have mobile_device in params
    Given I am a normal user
    When I go to the check page
    Then I should see "Normal User"

    
  