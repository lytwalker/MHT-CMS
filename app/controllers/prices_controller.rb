class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:create, :destroy]

  # POST /prices
  # POST /prices.json
  def create
    @price = @product.prices.new(price_params)

    respond_to do |format|
      if @price.save
        format.html { redirect_to @product, notice: 'Price was successfully added.' }
        format.json { render :show, status: :created, location: @price }
      else
        format.html { redirect_to @product, alert: "Unable to add price!" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price = @product.prices.find(params[:id])
    @price.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Price was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  	  def set_product
	  	@product = Product.find(params[:product_id])
	  end
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_params
      params.require(:price).permit(:length, :cost, :product_id)
    end
end
