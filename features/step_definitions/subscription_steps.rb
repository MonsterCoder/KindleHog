require 'fakeweb'

Given /^I have no subscription$/ do
  Given %{a user exists with password: "123456"}
end

Given /^I have (\d+) subscriptions$/ do |num|
  Given %{a user exists with password: "123456"}
  responds =  File.read(Rails.root.join("features/step_definitions/reponse.xml"))
  num.to_i.times do |i|
    subscription = Subscription.make(:user=> model(:user))
    FakeWeb.register_uri(:get, "#{subscription.link}", :body => responds)                                                 
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
    Then %{I should see "#{subscription.title}" within "#left_column"}
  end
end

Then /^I should see all news items$/ do
  user = model(:user)
  user.subscriptions.each do |subscription|
    rss = RSS::Parser.parse(File.read(Rails.root.join("features/step_definitions/reponse.xml")), false)
    rss.items.each {|item| Then %{I should see "#{item.title}"}}
  end
end

When /^I add a new subscription "([^"]*)"$/ do |link|
  responds =  File.read(Rails.root.join("features/step_definitions/reponse.xml"))
  FakeWeb.register_uri(:get, "#{link}", :body => responds)   
  Given %{I press "Add subscription"}
  And %{I fill in "subscription_link" with "#{link}"}
  And %{I press "subscription_submit"}
end

  
