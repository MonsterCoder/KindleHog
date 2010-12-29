class RegistrationsController < Devise::RegistrationsController
  private
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])   
      #@user.valid? 
    end
  
    @user.username = @user.email unless @user.username?
  end
end
