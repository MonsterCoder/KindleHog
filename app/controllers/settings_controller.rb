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
  
  def destroy 
    setting = current_user.settings.find_by_id(params[:id])
    current_user.settings.delete(setting)
    redirect_to :action =>:index
  end
  
  def edit
    @setting = current_user.settings.find_by_id(params[:id])
    render :partial => "settingform"
  end
  
  def update
    setting = current_user.settings.find_by_id(params[:id])
    setting.update_attributes(params[:setting])
    redirect_to :action => :index
  end
  
  
end
