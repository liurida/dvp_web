require 'test_helper'

class StudyMembersControllerTest < ActionController::TestCase
  setup do
    @study_member = study_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_member" do
    assert_difference('StudyMember.count') do
      post :create, study_member: {  }
    end

    assert_redirected_to study_member_path(assigns(:study_member))
  end

  test "should show study_member" do
    get :show, id: @study_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_member
    assert_response :success
  end

  test "should update study_member" do
    put :update, id: @study_member, study_member: {  }
    assert_redirected_to study_member_path(assigns(:study_member))
  end

  test "should destroy study_member" do
    assert_difference('StudyMember.count', -1) do
      delete :destroy, id: @study_member
    end

    assert_redirected_to study_members_path
  end
end
