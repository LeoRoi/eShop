require 'test_helper'

class CartTest < ActiveSupport::TestCase
  setup do
    @cart = carts(:one)
  end

  test "should get right total_price" do
    assert_equal(1.11, @cart.total_price)
  end

  test "should add quantity to Product" do
    assert_equal(2, @cart.add_product(products(:one)).quantity)
  end

  test "should add new Product" do
    assert_equal(1, @cart.add_product(products(:two)).quantity)
  end

end
