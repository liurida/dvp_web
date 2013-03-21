require 'test_helper'

class EcItemsControllerTest < ActionController::TestCase
  setup do
    @ec_item = ec_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ec_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ec_item" do
    assert_difference('EcItem.count') do
      post :create, ec_item: { author: @ec_item.author, compiled_status: @ec_item.compiled_status, creation_ts: @ec_item.creation_ts, description: @ec_item.description, message: @ec_item.message, modification_ts: @ec_item.modification_ts, modified_by: @ec_item.modified_by, name: @ec_item.name, proc_name: @ec_item.proc_name, reviewer: @ec_item.reviewer, tested_status: @ec_item.tested_status, type: @ec_item.type }
    end

    assert_redirected_to ec_item_path(assigns(:ec_item))
  end

  test "should show ec_item" do
    get :show, id: @ec_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ec_item
    assert_response :success
  end

  test "should update ec_item" do
    put :update, id: @ec_item, ec_item: { author: @ec_item.author, compiled_status: @ec_item.compiled_status, creation_ts: @ec_item.creation_ts, description: @ec_item.description, message: @ec_item.message, modification_ts: @ec_item.modification_ts, modified_by: @ec_item.modified_by, name: @ec_item.name, proc_name: @ec_item.proc_name, reviewer: @ec_item.reviewer, tested_status: @ec_item.tested_status, type: @ec_item.type }
    assert_redirected_to ec_item_path(assigns(:ec_item))
  end

  test "should destroy ec_item" do
    assert_difference('EcItem.count', -1) do
      delete :destroy, id: @ec_item
    end

    assert_redirected_to ec_items_path
  end
end
