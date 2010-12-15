require 'open-uri'
require 'rss'
require 'hpricot'

module PublishHelper
	def GetSubscriptions(feeds=current_user.feeds)
		entities = []
		
		feeds.each { |feed|
	   		rss = parse(feed.link)
	   		entities << {:feed => feed, :items => rss.items }
		}

		return entities
	end
end
