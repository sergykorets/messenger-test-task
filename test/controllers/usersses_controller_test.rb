require 'test_helper'

class UserssesControllerTest < ActionController::TestCase
  setup do
    @userss = usersses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usersses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userss" do
    assert_difference('Userss.count') do
      post :create, userss: {  }
    end

    assert_redirected_to userss_path(assigns(:userss))
  end

  test "should show userss" do
    get :show, id: @userss
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userss
    assert_response :success
  end

  test "should update userss" do
    patch :update, id: @userss, userss: {  }
    assert_redirected_to userss_path(assigns(:userss))
  end

  test "should destroy userss" do
    assert_difference('Userss.count', -1) do
      delete :destroy, id: @userss
    end

    assert_redirected_to usersses_path
  end
end
