class Item
	def initialize(rssitem)
		@rssitem = rssitem
	end
	
	def method_missing(m)
		return @rssitem.send(m) if @rssitem.respond_to?(m)
		""
	end
end
