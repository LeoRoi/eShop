require 'test_helper'

class AdminStoriesTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  # Ein Admin-User loggt sich ein, markiert eine Bestellung als "Delivered" und loggt sich aus
  test "mark order as sent" do
    start_order_count = Order.count
    first_order = products(:one)

    get "/login"
    assert_response :success

    post '/login', params: { name: 'myUser', password: 'secret', password_confirmation: 'secret' }, xhr: true
    assert_response :success

    get "/orders"
    assert_response :success

    perform_enqueued_jobs do
      delete order_path(first_order.id)
      assert_equal start_order_count - 1, Order.count

      mail = ActionMailer::Base.deliveries.last
      assert_equal ["test@example.org"], mail.to
      assert_equal 'eshop <marfoss429@gmail.com>', mail[:from].value
      assert_equal "Your Order has been Shipped", mail.subject
    end

    logout
    get "/orders"
    assert_redirected_to login_path

  end
end
