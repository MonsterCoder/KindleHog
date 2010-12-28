Feature: authenticatication
In order to authenticate a user 
As a user
I want to signin with my email and password or through twitter, facebook, googleid

Background: 
    Given the following users exist
         | email            | username      | password          |
         | 123@gmail.com    |abc| 123456            |
         | 456@gmail.com    | 456           | 456789            |
    And I am on the sign in page

Scenario: login with email and correct password should success
    Given I fill in the following:
         | user_login       | 456@gmail.com      |
         | user_password    | 456789             |
    When I press "Sign in"
    Then I should be on the feeds page
    
Scenario: login with usernmae and correct password should success
    Given I fill in the following:
         | user_login       |abc|
         | user_password    | 123456             |
    When I press "Sign in"
    Then I should be on the feeds page

Scenario: login with email and wrong password should fail
    Given I fill in the following:
         | user_login       | 123@gmail.com     |
         | user_password    | 456789            |
    When I press "Sign in"
    Then I should be on the sign in page
    And I should see "Invalid email or password."

#Scenario: signin Successfully through twitter
#   Given I follow "Twitter"
#    Then I should see "testkindlehog@gmail.com"
    
