class CartsController < ApplicationController
  include CurrentCart # modul current_cart in controllers/concerns
  before_action :set_cart, only: [:destroy]
  before_action :set_cart2, only: [:show]

  before_action :set_current_cart, only: [:index] # rufen methode set_cart vom CurrentCart auf

  # GET /carts
  # GET /carts.json
  def index
    redirect_to @cart
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to catalog_index_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def set_cart2
    @cart = Cart.includes(line_items: :product).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.fetch(:cart, {})
  end
end
