require 'open-uri'
require 'hpricot'

class PublishController < ApplicationController
  include FeedHelper
  include PublishHelper

  def index
	@entities = GetEntities()
	#feeds = Feed.find(:all)
	#feeds.each { |feed|
	#  rss = parse(feed.link)
	#   @entities = @entities + rss.items
	#}
  end
  
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
     FeedMailer.email('cheny2002@hotmail.com', @response).deliver
  
  end

end
