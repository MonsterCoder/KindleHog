Feature: my settings
As a user
I want to use a settings page to change my information and settings

Scenario: settings link
Given  I have signed in
Then  I should see "My settings"

Scenario: redirect to new settings when no setting exist
Given  I have signed in
When  I follow "My settings"
Then I should be on the new settings page

Scenario: list settings
Given I have 3 settings
    And  I have signed in
When  I follow "My settings"
Then I should all my settings

