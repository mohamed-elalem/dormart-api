class CartsController < ApplicationController
  prepend_before_action :authenticate_customer!
  before_action :set_cart

  def show; end

  def update
    @cart.products = Product.find(params[:products])
    @cart.save

    render 'show'
  end

  def destroy
    @cart.cart_products.destroy_all
    head :no_content
  end

  private

  def set_cart
    @cart = current_customer.cart
  end

  def cart_params
    params.require(:cart).permit(products: [])
  end
end
