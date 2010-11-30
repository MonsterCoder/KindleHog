module PublishHelper
	def GetEntities
		entities = []
		
		Feed.find(:all).each { |feed|
	   		rss = parse(feed.link)
	   		entities = @entities + rss.items
		}

		entities
	end
end
