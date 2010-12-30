require 'open-uri'
require 'rss'
require 'hpricot'

module PublishHelper
	def GetSubscriptions(feeds=current_user.subscriptions)
		entities = []
		
		feeds.each { |feed|
	   		rss = parse(feed.link)
	   		entities << {:feed => feed, :items => rss.items.map {|i| Item.new(i)} }
		}

		return entities
	end
end
