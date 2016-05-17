require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
  	@user = users(:michael)
  	@other_user = users(:archer)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
  	get :edit, id: @user
  	assert_redirectd_to login_url
  end

  test "should redirect update when not logged in" do
  	pathc :update, id: @user, user:{name: @user.name, email: @user.email}
  	assert_redirectd_to login_url
  end

  test "should redirect edit when logged  in as wrong user" do
  	log_in_as(@other_user)
  	get :edit, id: @user
  	assert_redirectd_to root_url
  end
  

  test "should redirect update when logged in as wrong user" do
  	log_in_as(@other_user)
  	patch :update, id: @user, user: {name: @user.name, email: @user.email }
  	assert_redirectd_to root_url
  end


end
