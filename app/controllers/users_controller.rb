class UsersController < ApplicationController
  def manage
	  @subcriptions = current_user.subscriptions
  end
end
