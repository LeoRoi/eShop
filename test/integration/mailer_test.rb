require 'test_helper'

class MailerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  test "mail order from admin shipped" do
    first_order = orders(:one)
    get "/orders"
    assert_response :success
    perform_enqueued_jobs do
      delete order_path(first_order.id)
      mail = ActionMailer::Base.deliveries.last
      assert_equal ["test@example.org"], mail.to
      assert_equal 'eshop <marfoss429@gmail.com>', mail[:from].value
      assert_equal "Your Order has been Shipped", mail.subject
    end
  end

  test "new order confirmation mail" do
    first_product = products(:one)
    post '/line_items', params: { product_id: first_product.id }, xhr: true
    assert_response :success

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

      mail = ActionMailer::Base.deliveries.last
      assert_equal ["beispiel@gmail.com"], mail.to
      assert_equal 'eshop <marfoss429@gmail.com>', mail[:from].value
      assert_equal "Order Confirmation", mail.subject
    end
  end
end
