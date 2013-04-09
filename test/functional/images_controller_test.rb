require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test "should get serve" do
    get :serve
    assert_response :success
  end

end
