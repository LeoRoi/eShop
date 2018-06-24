require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  setup do
    @cart = carts(:one)

  end

  test "should calculate total*quantity item price" do
    assert_equal(2.22, @cart.add_product(products(:one)).total_price)
  end
end
