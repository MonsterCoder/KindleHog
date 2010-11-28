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
    
    #APPFeedMailer.email(@response, response).deliver
end
