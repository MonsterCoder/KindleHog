class FeedMailer < ActionMailer::Base
  default :from => "cheny2002@hotmail.com"
  def email(feed, response)
     attachments["test.html"] = response
     mail(:to =>"georgec@price-hvac.com")
  end
end
