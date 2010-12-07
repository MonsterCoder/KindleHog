class LoginController < ApplicationController
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
	      p omniauth

	      if user.save
			flash[:notice] = "Signed in successfully."
			sign_in_and_redirect(:user, user)
	      else
			flash[:notice] =  "Failed creating a new user account from your twitter login, please sign-up and add Twitter as login option in settings."	
			session[:omniauth] = omniauth.except('extra')
			redirect_to new_user_registration_url
	      end

	      
	    end
	end
end
