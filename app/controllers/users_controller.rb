class UsersController < ApplicationController
  def manage
	  @subcriptions = current_user.feeds
  end
end
