require File.dirname(__FILE__) + '/../spec_helper'

describe OmniauthController do
  include Devise::TestHelpers
  fixtures :all
  render_views
 
  
  it "create action should redirect to root after logging in a user when authentication is found" do
    user = Factory(:user)
    user.authentications.create!(:provider => "twitter", :uid => "123")
    request.env["omniauth.auth"] = {"provider" => "twitter", "uid" => "123"}
    sign_in user
    post :create
    
    response.should redirect_to(root_url)
  end
  
  it "create action should add authentication when logged in to a registered user" do
    user = Factory(:user)
    @controller.stub!(:current_user).and_return(user)
    request.env["omniauth.auth"] = {"provider" => "twitter", "uid" => "456"}
    post :create
    user.authentications.first.uid.should == "456"
    response.should redirect_to(root_url)
  end
  
  it "create action should create a new user with property authentication data" do
    request.env["omniauth.auth"] = {"provider" => "twitter", "uid" => "456", "user_info"=>{ "email" => "123@gmail.com"}}
    post :create
    current_user.email.should = "123@gmail.com"
    response.should redirect_to(root_url)
  end

end
