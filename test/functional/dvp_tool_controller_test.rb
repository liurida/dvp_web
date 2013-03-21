require 'test_helper'

class DvpToolControllerTest < ActionController::TestCase
  test "should get show_study" do
    get :show_study
    assert_response :success
  end

  test "should get list_dvps" do
    get :list_dvps
    assert_response :success
  end

  test "should get show_dvp" do
    get :show_dvp
    assert_response :success
  end

  test "should get list_ecs" do
    get :list_ecs
    assert_response :success
  end

  test "should get show_ec" do
    get :show_ec
    assert_response :success
  end

end
