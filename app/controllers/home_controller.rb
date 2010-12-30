class HomeController < ApplicationController
  def index
	  redirect_to :subscriptions if user_signed_in?
  end

end
