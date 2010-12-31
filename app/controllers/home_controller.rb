class HomeController < ApplicationController
  def index
	  redirect_to user_subscriptions_url(current_user, current_user.subscriptions) if user_signed_in?
  end

end
