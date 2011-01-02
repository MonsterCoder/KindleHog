Feature: Home page
In order to use the kindle hog website
As a user
I want to see a welcome message and login link

Scenario: Welcome message
    Given I am on the home page
    Then I should see "Sign in"
        And I should see "Sign up"
        And I should see "Welcome to KindleHog!"

Scenario: Sign in
    Given I am on the home page
    When I follow "Sign in"
    Then I should be on the sign in page

Scenario: Sign up
    Given I am on the home page
    When I follow "Sign up"
    Then I should be on the sign up page

