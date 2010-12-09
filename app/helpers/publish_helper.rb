require 'open-uri'
require 'rss'
require 'hpricot'

module PublishHelper
	def GetEntities
		entities = []
		
		current_user.feeds.each { |feed|
	   		rss = parse(feed.link)
	   		entities = entities + rss.items 
		}

		entities
	end
end
