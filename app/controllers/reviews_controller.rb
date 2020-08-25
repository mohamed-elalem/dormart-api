class ReviewsController < ApplicationController
  before_action :set_product
  skip_before_action :authenticate_user_by_type

  def index
    @reviews = @product.reviews.includes(:rate).page(params[:page]).per(5)
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end
end
