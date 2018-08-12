class OrderMailer < ApplicationMailer

  def seller(order)
    @order = order
    mail to: order.email, subject: 'You have received an Order!'
  end

  def received(order)
    @order = order
    mail to: order.email, subject: 'Order Confirmation'
  end

  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Your Order has been Shipped'
  end
end
