require 'open-uri'
require 'hpricot'

class PublishController < ApplicationController
  include FeedHelper
  include PublishHelper

  
  def create 
     @entities = GetEntities()
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

end
