require File.dirname(__FILE__) + '/../spec_helper'

describe FeedsController do
    fixtures :all
    describe "GET index" do
      it "assign all subsriptions of current_user as @entries" do
        @user = User.new ({:email=>"123@gmail.com"})
        @controller.stub!(:current_user).should_return(@user)
        get :index
      end
    end
end
