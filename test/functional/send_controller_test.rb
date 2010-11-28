require 'test_helper'

class SendControllerTest < ActionController::TestCase
  test "should get preview" do
    get :preview
    assert_response :success
  end

end
