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
                go(user, setting.send_to)
            setting.save
          end
        end
      end
    end
  end


  def go(user, email)
         entities = GetSubscriptions(user.subscriptions)
         response = ""
         body =''
         ref =''

         entities.each_with_index { |entity, i|
              entity[:items].each { |item|
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
 
        FeedMailer.email(email,response).deliver 
        
        p "send to address #{email}"
  end
end
