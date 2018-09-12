class LineItemsController < ApplicationController
  skip_before_action :authorize

  include CurrentCart
  before_action :set_current_cart, only: [:create, :increase, :decrease]
  before_action :set_line_item, only: [:destroy]

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find params[:product_id]
    @line_item = @cart.add_product(product)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @cart, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
        format.js
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @line_item.cart, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def decrease
    product = Product.find params[:product_id]
    @line_item = @cart.remove_product(product)
    respond_to do |format|
      @line_item.save
      format.html { redirect_to URI.parse(@line_item.cart).path, notice: 'Line item was successfully created.' }
      format.json { render :show, status: :created, location: @line_item }
      format.js
    end
  end

  def increase
    product = Product.find params[:product_id]
    @line_item = @cart.add_product(product)

    respond_to do |format|
      @line_item.save
      format.html { redirect_to URI.parse(@line_item.cart).path, notice: 'Line item was successfully created.' }
      format.json { render :show, status: :created, location: @line_item }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

end
