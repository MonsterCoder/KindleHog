Given /^I have (\d+) settings$/ do |num|
  Given %{a user exists with password: "123456"} 
  Given %{#{num} settings exist with user: user} 

end

Then /^I should see all my settings$/ do
  user = model(:user)
  user.settings.each do |setting|
  Then %[I should see "#{setting.send_to}"]
  Then %[I should see "#{setting.schedualed_send}"]
  end
end

When /^I press the (\d+)th "delete" button$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
