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

Scenario: add new settings
    Given I have signed in
        And  I follow "My settings"
    When I fill in the following:
        |setting_send_to        |testkindlehog@gmail.com|
        |setting_schedualed_send|12                     |
        |setting_items_after    |2010/01/01             | 
        And I press "setting_submit"
   Then I should be on the settings page
        And I should see "Setting was successfully created."
        And I should see "testkindlehog@gmail.com"
        And I should see "12"
        And I should see "2010-01-01"
  

