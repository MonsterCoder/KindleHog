require 'open-uri'
require 'rss'
require 'hpricot'

module PublishHelper
	def GetEntities(feeds=current_user.feeds)
		entities = []
		
		feeds.each { |feed|
	   		rss = parse(feed.link)
	   		entities = entities + rss.items 
		}

		return entities
	end
end
