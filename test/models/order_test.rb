require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = orders(:one)
    @cart = carts(:one)
  end

  test "should be valid" do
    assert @order.valid?
  end

  test "name should be present" do
    @order.name = '     '
    assert_not @order.valid?
  end

  test "street should be present" do
    @order.street = '     '
    assert_not @order.valid?
  end

  test "street_number should be present" do
    @order.street_number = '     '
    assert_not @order.valid?
  end

  test "city should be present" do
    @order.city = '     '
    assert_not @order.valid?
  end

  test "state should be present" do
    @order.state = '     '
    assert_not @order.valid?
  end

  test "zip_code should be present" do
    @order.zip_code = '     '
    assert_not @order.valid?
  end

  test "country should be present" do
    @order.country = '     '
    assert_not @order.valid?
  end

  test "email should be present" do
    @order.email = '     '
    assert_not @order.valid?
  end

  test "payType should be correct" do
    assert_raises ArgumentError do
      @order.pay_type = "try"
    end
  end

  test "should add line items from cart" do
    @order.add_line_items_from_cart(@cart)
    assert_equal(2, @order.line_items.size)
  end

end
