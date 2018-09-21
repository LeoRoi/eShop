require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = '     '
    assert_not @user.valid?
  end

  test "name should be uniqueness" do
    @user2 = User.new(name: 'myUser', password: 'aaa', password_confirmation: 'aaa')
    assert_not @user2.valid?
  end

end
