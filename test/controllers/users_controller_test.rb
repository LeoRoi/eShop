require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user2 = users(:two)
    @def_loc = 'en'
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { name: 'testName', password: 'secret', password_confirmation: 'secret' } }
    end

    assert_redirected_to users_url(locale: @def_loc)
  end

  test 'should not create user' do
    post users_url, params: { user: { name: 'testName', password: 'secret', password_confirmation: 'not secret' } }
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user), params: { user: { name: @user.name, password: 'secret', password_confirmation: 'secret' } }
    assert_redirected_to users_url(locale: @def_loc)
  end

  test 'should not update user' do
    patch user_url(@user), params: { user: { name: @user.name, password: 'secret', password_confirmation: 'omg' } }
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user2)
    end

    assert_redirected_to users_url(locale: @def_loc)
  end

  test 'should not destroy last user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
      delete user_url(@user2)
    end

    assert_redirected_to users_url(locale: @def_loc)
  end
end
