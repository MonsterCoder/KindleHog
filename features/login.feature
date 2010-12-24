Feature: authenticatication
In order to authenticate a user 
As a user
I want to signin with my email and password or through twitter, facebook, googleid

Background: 
    Given the following users exist
         | email            | password            |
         | 123@gmail.com    | 123456            |
         | 456@gmail.com    | 456789            |
    And I am on the sign in page

Scenario: signin Successfully
    Given I fill in the following:
         | user_email       | 123@gmail.com      |
         | user_password    | 123456             |
    When I press "Sign in"
    Then I should be on the feeds page

Scenario: signin failed
    Given I fill in the following:
         | user_email       | 123@gmail.com      |
         | user_password    | 456789            |
    When I press "Sign in"
    Then I should be on the sign in page
    And I should see "Invalid email or password."

