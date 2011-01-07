Feature: my settings
As a user
I want to use a settings page to change my information and settings

Scenario: settings link
When  I have signed in
Then  I should see "My settings"

@wip
Scenario: go to settings page
When  I have signed in
And  I follow "My settings"
Then I should be on the settings page

