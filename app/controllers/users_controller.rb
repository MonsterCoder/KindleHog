class UsersController < ApplicationController
  def index
	render :partial=>"management", :collection=>current_user.feeds
  end
end
