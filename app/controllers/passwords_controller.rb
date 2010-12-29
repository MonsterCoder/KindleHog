class PasswordsController < Devise::PasswordsController
    # POST /resource/password  
    def create  
      p "+++++++++++++++++" 
      p params[resource_name] 
      self.resource = resource_class.send_reset_password_instructions(params[resource_name]) 
      p self.resource   
      if resource.errors.empty?      
        set_flash_message :notice, :send_instructions      
        redirect_to new_session_path(resource_name)    
      else      
        render_with_scope :new    
      end  
    end
end
