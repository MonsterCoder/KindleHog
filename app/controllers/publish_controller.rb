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
     @response = "<html><body>"
     @entities.each { |entity|
       begin
	p entity.link + "-----------------"
       doc = Hpricot(open(entity.link).read)
       rescue
         p entity.link + " failed"
       end
       @response = @response + (doc/"body").inner_html 
     }

     @response = @response +"</body></html>"
     FeedMailer.email('cheny2002_36@kindle.com', @response).deliver
     #render :html=>@response
  end
    
    #
end
