Feature: subscriptions list
In order to use kindle hog to read rss
As a user
I want to see a list of my subscritions

Scenario: no subscription
Given I have no subscription
When I have signed in
And I should see "You currently don't have any subsrciption."

