require 'test_helper'
# load test data

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should ask for login" do
    get login_url
    assert_response :success
  end

  test "should log in" do
    temp = users(:one)
    post login_url, params: { name: temp.name, password: 'secret' }
    assert_redirected_to admin_url
    assert_equal temp.id, session[:user_id]
  end

  test "should not log in" do
    user = users(:two)
    post login_url, params: { name: user.name, password: 'fuu' }
    assert_redirected_to login_url
  end

  test "should log out" do
    delete logout_url
    assert_redirected_to catalog_index_url
  end

end
