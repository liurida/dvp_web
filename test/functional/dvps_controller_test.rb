require 'test_helper'

class DvpsControllerTest < ActionController::TestCase
  setup do
    @dvp = dvps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dvps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dvp" do
    assert_difference('Dvp.count') do
      post :create, dvp: { desc: @dvp.desc, name: @dvp.name, study: @dvp.study }
    end

    assert_redirected_to dvp_path(assigns(:dvp))
  end

  test "should show dvp" do
    get :show, id: @dvp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dvp
    assert_response :success
  end

  test "should update dvp" do
    put :update, id: @dvp, dvp: { desc: @dvp.desc, name: @dvp.name, study: @dvp.study }
    assert_redirected_to dvp_path(assigns(:dvp))
  end

  test "should destroy dvp" do
    assert_difference('Dvp.count', -1) do
      delete :destroy, id: @dvp
    end

    assert_redirected_to dvps_path
  end
end
