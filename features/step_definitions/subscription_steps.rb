require 'fakeweb'

Given /^I have no subscription$/ do
  Given %{a user exists with password: "123456"}
end

Given /^I have (\d+) subscriptions$/ do |num|
  Given %{a user exists with password: "123456"}
  num.to_i.times do |i|
    subscription = Subscription.make(:user=> model(:user))
    FakeWeb.register_uri(:get, "#{subscription.link}", :body => "Nothing to be found 'round here")                                                 
  end
end

When /^I have signed in$/ do
  user = model(:user)
  Given %{I go to the sign in page}
  And %{I fill in "user_login" with "#{user.email}"}  
  And %{I fill in "user_password" with "123456"}
  And %{I press "Sign in"}
end

Then /^I should see all my subscriptions$/ do
  user = model(:user)
  user.subscriptions.each do |subscription|
    Then %{I should see "#{subscription.link}"}
  end
end
