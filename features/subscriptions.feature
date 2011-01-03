Feature:  list subscriptions
In order to use kindle hog
As a user
I want to see a list of my subscritions

Scenario: no subscription
Given I have no subscription
When I have signed in
And I should see "You currently don't have any subsrciption."

Scenario: user with subscriptions
Given I have 10 subscriptions
When I have signed in
And I should see all my subscriptions
