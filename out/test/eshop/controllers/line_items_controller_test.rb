require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:one).id }
    end
    assert_redirected_to cart_url(LineItem.last)
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item:
                                                 { cart_id: @line_item.cart_id,
                                                   product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to cart_url
  end

  test "should increase line_item" do
    post line_items_url, params: { product_id: products(:one).id }
    @cart = Cart.find(session[:cart_id])
    put increase_line_item_url(@line_item), params: { product_id: @line_item.product_id }
    assert_equal(2.22, @cart.total_price)
  end

  test "should decrease line_item" do
    post line_items_url, params: { product_id: products(:one).id }
    @cart = Cart.find(session[:cart_id])
    put decrease_line_item_url(@line_item), params: { product_id: @line_item.product_id }
    assert_equal(0, @cart.total_price)
  end

end
