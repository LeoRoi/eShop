require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user_my_admin = users(:two)
    @def_loc = 'en'
    logout
  end

  test 'login page' do
    get login_path
    assert_select 'h2', text: "Enter your account data"
    assert_select '#user_name', count: 1
    assert_select '#user_password', count: 1
    assert_select '#login_btn', count: 1
    assert_select '#login_cancel', count: 1
  end

  test 'login with valid information followed by logout' do
    post login_url, params: { name: @user_my_admin.name, password: 'secret' }
    assert_redirected_to admin_url(locale: @def_loc)
    get admin_url
    assert_response :success
    assert_select '#admin_title', text: "Admin panel"
    assert_select '#admin_info', count: 1
    get orders_path
    assert_response :success
    get users_path
    assert_response :success
    get products_path
    assert_response :success

    delete logout_path
    assert flash[:notice] == 'Logged out'
    get orders_path
    assert_redirected_to login_path(locale: @def_loc)
    get users_path
    assert_redirected_to login_path(locale: @def_loc)
    get products_path
    assert_redirected_to login_path(locale: @def_loc)
  end

  test 'login with invalid information' do
    post login_url, params: { name: 'invalidName', password: 'invalidPassword' }
    assert_redirected_to login_url(locale: @def_loc)
    assert flash[:notice] == 'Log in required!'
    get orders_path
    assert_redirected_to login_path(locale: @def_loc)
    get users_path
    assert_redirected_to login_path(locale: @def_loc)
    get products_path
    assert_redirected_to login_path(locale: @def_loc)
  end

end
