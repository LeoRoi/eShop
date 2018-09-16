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

  test "address should be present" do
    @order.address = '     '
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
