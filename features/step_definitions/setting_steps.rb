Given /^I have (\d+) settings$/ do |num|
  Given %{a user exists with password: "123456"} 
  Given %{#{num} settings exist with user: user} 

end

Then /^I should all my settings$/ do
  user = model(:user)
  user.settings.each do |setting|
  Then %[I should see "#{setting.send_to}"]
  Then %[I should see "#{setting.schedualed_send}"]
  end
end

