#Current Cart in Current Session. Falls cart nicht gefunden, es wird eine neue erzeugt
module CurrentCart

  private

  def set_current_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
