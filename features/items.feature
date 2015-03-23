Feature: Items
  In order to manage my Items
  As a user
  I want to be able to interact by my app

  Scenario: Rendering list of items
    Given there are items "Butter, Potatoes, Juice"
    And I am at the home page
    Then I should see item "Butter"
    And I should see item "Potatoes"
    And I should see item "Juice"
