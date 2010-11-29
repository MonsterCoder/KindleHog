class FeedMailer < ActionMailer::Base
  default :from => "cheny2002@hotmail.com"
  def email(emailAddr, response)
     attachments["RSSFeed.html"] = response
     mail(:to =>emailAddr)
  end
end
