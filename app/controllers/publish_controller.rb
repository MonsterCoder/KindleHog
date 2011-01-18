require 'open-uri'
require 'hpricot'

class PublishController < ApplicationController
  include FeedHelper
  include PublishHelper
  
  def process  
    users = User.find(:all)
    users.each do |user|
      user.settings.each do |setting|
         
        if setting.items_after < DateTime.now 
         
          if (DateTime.now.beginning_of_day + (setting.schedualed_send.to_i / 24.0)) < (DateTime.now) 
            setting.items_after = DateTime.now + 1
                go(setting)
            setting.save
          end
        end
      end
    end
  end


  def go(setting)
        content = generateContent(setting)
        FeedMailer.email(setting.send_to,content).deliver 
  end
  
  def generateContent(setting,lastupdate=true)
        response = ""
         body =''
         ref =''
         
        setting.user.subscriptions.each_with_index do |subscription, j|
          items = GetSubscription(subscription)
          items.each_with_index { |item, i|
              begin
                    if (DateTime.parse(item.pubDate.to_s) >  subscription.LastUpdate) 
                     	doc = Hpricot(open(item.link).read)
                      ref =ref +"<a href=\"#c#{j}#{i}\"> #{item.title} </a> <br/>"
                      html =(doc/"body").inner_html
                      body = "#{body}  <a name=\"c#{j}#{i}\"> <p> #{html} </p></a><br/>"
                    end
              rescue
                    ref =ref + "#Failed in getting - #{item.link} - <br/>"
              end
          }
          
          if lastupdate
            last = items.max {|a,b| a.pubDate <=> b.pubDate } 
            subscription.LastUpdate = DateTime.parse(last.pubDate.to_s)
            subscription.save
          end
        end    

        response = "<html><body> #{ref} #{ body} </body></html>"
  end
end
