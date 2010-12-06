class LoginController < ApplicationController
	def twitter	
	   
	    @user = User.find_for_twitter_oauth(env["omniauth.auth"], current_user)

	    if @user.persisted?
	      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
	      sign_in_and_redirect @user, :event => :authentication
	    else
	      session["devise.twitter_data"] = env["omniauth.auth"]
	      redirect_to new_user_registration_url
	    end
	end
end
