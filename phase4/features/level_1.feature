Feature: Manage investigations
  As an administrator
  I want to be able to manage investigation information
  So I can effective track crimes in Gotham City

  Background:
    Given an initial setup
  
  # READ METHODS
  Scenario: No investigations yet
    Given no setup yet
    When I go to the investigations page
    Then I should see "There are no open investigations at this time"
    And I should not see "Title"
    And I should not see "Date open"
    And I should not see "Lacey Towers Murder"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View all investigations
    When I go to the investigations page
    Then I should see "Open Investigations"
    And I should see "Title"
    And I should see "Date open"
    And I should see "Lacey Towers Murder"
    And I should see "Great Gotham Harbor Arson"
    And I should see "09/23/18"
    And I should see "Recent Cases Involving Batman"
    And I should see "Case"
    And I should see "Open?"
    And I should see "Pussyfoot Heist"
    And I should see "No"
    And I should not see "Show"
    And I should not see "Destroy"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
    And I should not see "2018-09-23"
  
  Scenario: The investigation name is a link to investigation details
    When I go to the investigations page
    And I click on the link "Great Gotham Harbor Arson"
    Then I should see "Crime committed:   Arson"
    And I should see "Location:   Gotham Harbor"
    And I should see "Over $24 million in property damage done."
    And I should see "Was Batman involved?   No"
    And I should see "Current Assignments"
    And I should see "Azeveda, Josh"
    And I should not see "Blake, John"
    And I should not see "Murder"
    And I should not see "Lacey"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View investigation details
    When I go to the details on the Lacey Towers Murder
    Then I should see "Crime committed:   Murder"
    And I should see "Location:   Lacey Towers"
    And I should see "Tiffany Ambrose was murdered in Lacey Towers."
    And I should see "Date opened:   September 23, 2018"
    And I should see "Was Batman involved?   No"
    And I should see "Current Assignments"
    And I should see "Blake, John"
    And I should see "Close Now"
    And I should not see "Gotham Harbor"
    And I should not see "Jordan Stapinski"
    And I should not see "2018-07-20"
    And I should not see "true"
    And I should not see "True"
  
