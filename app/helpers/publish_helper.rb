require 'open-uri'
require 'rss'
require 'hpricot'

module PublishHelper
	def GetSubscriptions(subscriptions=current_user.subscriptions)
    GetSubscriptions(subscriptions, DateTime.now - 3)
	end
	
		def GetSubscriptions(subscriptions=current_user.subscriptions, after = DateTime.beginning_of_day(DateTime.now))
		entities = []
		subscriptions.each { |subscription|
	     		rss = parse(subscription.link)
	     		entities << {:feed => feed, :items => rss.items.map {|i| Item.new(i)} }
		}

		return entities
	end
end


