require 'open-uri'
require 'hpricot'

class PublishController < ApplicationController
  include FeedHelper
  include PublishHelper

  
  def create 
     @entities = GetSubscriptions()
     @response = ""
     body =''
     ref =''

     @entities.each_with_index { |entity, i|
       begin
       	doc = Hpricot(open(entity.link).read)
        ref =ref +"<a href=\"#c#{i}\"> #{entity.title} </a> <br/>"
        html =(doc/"body").inner_html
	body = "#{body}  <a name=\"c#{i}\"> <p> #{html} </p></a><br/>"
       rescue
        ref =ref + "#Failed in getting - {entity.link} - <br/>"
       end
     }

     @response = "<html><body> #{ref} #{ body} </body></html>"

     if (current_user.targetEmail)
     	  FeedMailer.email(current_user.targetEmail, @response).deliver 
     else
	      FeedMailer.email(current_user.email, @response).deliver 
     end
  
  end
  
  def process
    
    users = User.find(:all)
    users.each do |user|
      user.settings.each do |setting|
         
        if setting.items_after < DateTime.now 
         
          if (DateTime.now.beginning_of_day + (setting.schedualed_send.to_i / 24)) < (DateTime.now) 
            setting.items_after = DateTime.now + 1
                go(setting)
            setting.save
          end
        end
      end
    end
  end


  def go(setting)
         entities = GetSubscriptions(setting.user.subscriptions)
         response = ""
         body =''
         ref =''

         entities.each { |entity|
              entity[:items].each_with_index { |item, i|
                       begin
                            
                           	doc = Hpricot(open(item.link).read)
                            ref =ref +"<a href=\"#c#{i}\"> #{item.title} </a> <br/>"
                            html =(doc/"body").inner_html
	                          body = "#{body}  <a name=\"c#{i}\"> <p> #{html} </p></a><br/>"
                       rescue
                            ref =ref + "#Failed in getting - #{item.link} - <br/>"
                       end
                         
               }
         }

         response = "<html><body> #{ref} #{ body} </body></html>"
 
        FeedMailer.email(setting.send_to,response).deliver 
        
        p "send to address #{setting.send_to}"
  end
end
