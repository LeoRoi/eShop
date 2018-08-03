class LineItemsController < ApplicationController
  include CurrentCart #modul current_cart in controllers/concerns
  before_action :set_cart, only: [:create] #rufen methode set_cart vom CurrentCart auf

  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find params[:product_id] # product finden vom parameter product_id der Request

    if params[:operation].to_i == 0
        @line_item = @cart.add_product(product) # add_product methode in model definiert
      else
        @line_item = @cart.remove_product(product) # add_product methode in model definiert
    end



    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_path(id: @line_item.cart.id), notice: 'Line item was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.required(:line_item).permit(:product_id, :cart_id)
  end
end
