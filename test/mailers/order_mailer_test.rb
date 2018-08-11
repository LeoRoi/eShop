require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Order Confirmation", mail.subject
    assert_equal ["test@example.org"], mail.to
    assert_equal ["marfoss429@gmail.com"], mail.from
    assert_match /1 x MyString3/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Your Order has been Shipped", mail.subject
    assert_equal ["test@example.org"], mail.to
    assert_equal ["marfoss429@gmail.com"], mail.from
  end

  test "seller" do
    mail = OrderMailer.seller(orders(:one))
    assert_equal "You have received an Order!", mail.subject
    assert_equal ["test@example.org"], mail.to
    assert_equal ["marfoss429@gmail.com"], mail.from
  end

end
