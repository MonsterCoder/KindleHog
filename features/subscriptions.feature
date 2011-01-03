Feature:  subscriptions
In order to use kindle hog
As a user
I want to list, add subscritions

Scenario: no subscription
Given I have no subscription
When  I have signed in
And   I should see "You currently don't have any subsrciption."

Scenario: user with subscriptions
Given I have 3 subscriptions
When  I have signed in
Then  I should see all my subscriptions
And   I should see all news items

Scenario: user add a subscription
Given I have no subscription
And   I have signed in
When  I add a new subscription "www.rss.com"
Then  I should see "Successfully added a new subscription."
#And   I should see "www.rss.com" within "#left_column"
And   1 subscriptions should exist with link: "http://www.rss.com"

