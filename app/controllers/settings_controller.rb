class SettingsController < ApplicationController
  def index
    redirect_to new_user_setting_path if current_user.settings.count == 0
    @settings = current_user.settings
  end
  
  def new
    @setting = current_user.settings.build
    render :partial => "settingform"
  end
  
end
