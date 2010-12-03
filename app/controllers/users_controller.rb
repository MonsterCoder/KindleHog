class UsersController < ApplicationController
        def index
		@feeds = Feed.find_by_user_id(self.current_user.id)
	end

	def show
		@kindleAddress = self.current_user.kindleAddress
	end
end
