require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @def_loc = 'en'
  end

  test "should get index" do
    get carts_url
    assert_response :found
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {} }
    end

    assert_redirected_to cart_url(Cart.last, locale: @def_loc)
  end

  test "should show cart" do
    post line_items_url, params: { product_id: products(:one).id }
    @cart = Cart.find(session[:cart_id])
    get cart_url(@cart)
    assert_response :success
  end

  test "should destroy cart" do
    post line_items_url, params: { product_id: products(:one).id }
    @cart = Cart.find(session[:cart_id])
    assert_difference('Cart.count', -1) do
      delete cart_url(@cart)
    end
    assert_redirected_to catalog_index_url(locale: @def_loc)
  end
end
