Given /^I have no subscription$/ do
  Given %{a user exists with password: "123456"}
end

Given /^I have (\d+) subscription$/ do
  Given %{a user exists with password: "123456"}
  $1.times {|t| Subscription.make(:user=> model(:user))}
end

When /^I have signed in$/ do
  user = model(:user)
  Given %{I go to the sign in page}
  And %{I fill in "user_login" with "#{user.email}"}  
  And %{I fill in "user_password" with "123456"}
  And %{I press "Sign in"}
end
