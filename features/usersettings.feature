Feature: my settings
As a user
I want to use a settings page to change my information and settings

Scenario: settings link
Given  I have signed in
Then  I should see "My settings"

Scenario: go to settings page without a setting exists
Given  I have signed in
When  I follow "My settings"
Then I should be on the new settings page

@wip
Scenario: go to settings page with settings exist
Given I have 3 settings
    And  I have signed in
When  I follow "My settings"
Then I should all my settings

