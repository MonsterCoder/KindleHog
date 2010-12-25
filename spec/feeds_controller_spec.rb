require File.dirname(__FILE__) + '/spec_helper'



describe FeedsController do
  include Devise::TestHelpers

   before(:all) do
    @user = User.new ({:email=>"123@gmail.com"})
    sign_in :user, @user
   end
   
    describe "GET index" do
      it "assign all subsriptions of current_user as @entries" do
        current_user should be==@user
      end
    end
end
