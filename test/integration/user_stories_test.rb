require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products
  include ActiveJob::TestHelper

  # Ein User ist im Homepage, kauft einen Produkt und geht in den Kart. Danach
  # macht er den Checkout, fuegt seine Daten ein und sendet die Bestellung.

  test "buying a product" do
    start_order_count = Order.count
    first_product = products(:one)

    get "/"
    assert_response :success

    post '/line_items', params: { product_id: first_product.id }, xhr: true
    assert_response :success

    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal first_product, cart.line_items[0].product

    perform_enqueued_jobs do
      post "/orders", params: {
        order: {
          name: "Claudio Vindimian",
          address: "Hermanstrasse 2",
          email: "beispiel@gmail.com",
          pay_type: "Check"
        }
      }
      follow_redirect!
      assert_response :success
      assert_equal start_order_count + 1, Order.count

      order = Order.last
      assert_equal "Claudio Vindimian", order.name
      assert_equal "Hermanstrasse 2", order.address
      assert_equal "beispiel@gmail.com", order.email
      assert_equal "Check", order.pay_type
      assert_equal 1, order.line_items.size

      line_item = order.line_items[0]
      assert_equal first_product, line_item.product

      mail = ActionMailer::Base.deliveries.last
      assert_equal ["beispiel@gmail.com"], mail.to
      assert_equal 'eshop <marfoss429@gmail.com>', mail[:from].value
      assert_equal "Order Confirmation", mail.subject
    end
  end
end
