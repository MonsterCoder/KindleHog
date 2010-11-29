require 'open-uri'
require 'hpricot'

class PublishController < ApplicationController
  include FeedHelper
  def index
	@entities = []
	feeds = Feed.find(:all)
	feeds.each { |feed|
	   rss = parse(feed.link)
	   @entities = @entities + rss.items
	}
          
  end
  
  def create 
     @entities = []
	feeds = Feed.find(:all)
	feeds.each { |feed|
	   rss = parse(feed.link)
	   @entities = @entities + rss.items
     }
     @response = ""
     body =''
     ref =''

     @entities.each_with_index { |entity, i|
       begin
	p entity.link + "-----------------"
       	doc = Hpricot(open(entity.link).read)
        ref =ref +"<a href=\"#{i}\"> #{entity.title} </a>"
        html =(doc/"body").inner_html
	body = "#{body}  <a name=\"#{i}\"> #{html} </a>"
       rescue
         p entity.link + " failed"
       end
       
     }

     @response = "<html><body> #{ref} #{ body} </body></html>"
     FeedMailer.email('cheny2002_36@kindle.com', @response).deliver
     #render :html=>@response
  end
    
    #
end
