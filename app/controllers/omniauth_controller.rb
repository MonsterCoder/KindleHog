class OmniauthController < ApplicationController
	def twitter	
	    omniauth = request.env["omniauth.auth"]
	    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
	    if authentication
	      flash[:notice] = "Signed in successfully."
	      sign_in_and_redirect(:user, authentication.user)
	    elsif current_user
	      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
	      flash[:notice] = "Authentication successful."
	      redirect_to :user
	    else
	      user = User.new
	      user.apply_omniauth(omniauth)

	      if user.save
			    flash[:notice] = "Signed in successfully."
			    sign_in_and_redirect(:user, user)
	      else
	        flash[:notice] = "Please input an email address and a password here. You can login by using either Twitter or usename/password next time."
			    session[:omniauth] = omniauth.except('extra')
			    redirect_to new_user_registration_url
	      end     
	    end
	end
end
