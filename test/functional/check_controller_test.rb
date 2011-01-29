require 'test_helper'

class CheckControllerTest < ActionController::TestCase
  test "should get user_agent" do
    get :user_agent
    assert_response :success
  end

end
