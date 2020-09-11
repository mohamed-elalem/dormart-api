class CartsController < ApplicationController
  prepend_before_action :authenticate_customer!
  before_action :set_cart

  def show; end

  def destroy
    @cart.cart_products.destroy_all
    head :no_content
  end

  def add_to_cart
    cart_product = @cart.cart_products.find_or_initialize_by(product_id: params[:product_id])
    cart_product.quantity += params[:quantity].to_i
    if cart_product.save
      render 'show'
    end
  end

  private

  def set_cart
    @cart = current_customer.cart
  end

  def cart_params
    params.require(:cart).permit(products: [])
  end
end
