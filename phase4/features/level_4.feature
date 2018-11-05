Feature: Manage crimes
  As an administrator
  I want to be able to manage crime information
  To later be able to connect to investigations

  Background:
    Given an initial setup

  # READ METHODS
  Scenario: No crimes yet
    Given no setup yet
    When I go to the crimes page
    And I should see "There are no active crimes at this time"
    And I should not see "Arson"
    And I should not see "Level"
    And I should not see "Felony"
    And I should not see "Misdemeanor"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View all crimes
    When I go to the crimes page
    Then I should see "Active Crimes"
    And I should see "Crime"
    And I should see "Arson"
    And I should see "Murder"
    And I should see "Level"
    And I should see "Felony"
    And I should see "Misdemeanor"
    And I should see "Active"
    And I should see "Yes"
    And I should not see "Show"
    And I should not see "Destroy"
    And I should not see "Description"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
