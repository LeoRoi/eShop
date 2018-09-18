require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    post line_items_url, params: { product_id: products(:one).id }

    get new_order_url
    assert_response :success
  end

  test "should create order" do
    post line_items_url, params: { product_id: products(:one).id }
    assert_difference('Order.count') do
      post orders_url, params: { order:
                                   { pay_type: @order.pay_type,
                                     address: @order.address,
                                     email: @order.email,
                                     name: @order.name } }
    end

    assert_redirected_to catalog_index_url
  end

  test "should not create order" do # without address (validation test)
    assert_difference('Order.count', 0) do
      post orders_url, params: { order: { pay_type: @order.pay_type, email: @order.email, name: @order.name } }
    end
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end

  test "requires item in cart" do
    get new_order_url
    assert_redirected_to catalog_index_path
    assert_equal flash[:notice], 'Your cart is empty!'
  end

end
