class ReviewsController < ApplicationController
  before_action :set_product

  def index
    @reviews = @product.reviews.includes(:rate).page(params[:page]).per(5)
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end
end
