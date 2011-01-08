class SettingsController < ApplicationController
  def index
    redirect_to new_user_setting_path if current_user.settings.count == 0
    @settings = current_user.settings
  end
  
  def new
    @setting = current_user.settings.build
    render :partial => "settingform"
  end
  
  def create
    @setting = current_user.settings.build(params[:setting])

    if @setting.save
      respond_to do |format|
        format.html { redirect_to(user_settings_path, :notice => 'Setting was successfully created.') }
      end
    else
      respond_to do |format|
        format.html { render @setting, :error => "Creating setting failed." }  
      end    
    end
  end
  
end
