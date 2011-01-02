require File.dirname(__FILE__) + '/../spec_helper'

describe OmniauthController do
  include Devise::TestHelpers

  it "create action should redirect to root after logging in a user when authentication is found" do
    user = User.make
    user.authentications.create!(:provider => "twitter", :uid => "123")
    request.env["omniauth.auth"] = {"provider" => "twitter", "uid" => "123"}
    sign_in user
    post :create
    
    response.should redirect_to(root_url)
  end
  
  it "create action should add authentication when logged in to a registered user" do
    user = User.make
    @controller.stub!(:current_user).and_return(user)
    request.env["omniauth.auth"] = {"provider" => "twitter", "uid" => "456"}
    post :create
    user.authentications.first.uid.should == "456"
    response.should redirect_to(root_url)
  end
  
  it "create action should create and signin a new user when first time user sign in with an oauth service" do
    request.env["omniauth.auth"] = {"provider" => "facebook", "uid" => "456", "user_info"=>{ "email" => "123@gmail.com"}}
    post :create

    Authentication.find_by_provider_and_uid("facebook", "456").should_not be_nil
    Authentication.find_by_provider_and_uid("facebook", "456").user.email.should == "123@gmail.com"
    @controller.current_user.email.should == "123@gmail.com"
    response.should redirect_to(root_url)
  end
  
  it "create action should redirect to sign-up page when first time user that signs in with an oauth service that does not provide email information" do
    request.env["omniauth.auth"] = {"provider" => "facebook", "uid" => "456", "user_info"=>{}}
    post :create
    session[:omniauth].should_not be_nil
    response.should redirect_to(new_user_registration_url)
  end

end
