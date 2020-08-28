class ProductsController < ApplicationController
  before_action :set_category
  before_action :set_product, except: %i[index create]
  skip_before_action :authenticate_user_by_type, only: %i[index show]

  def index
    @products = @category.products.page(params[:page])
  end

  def show; end

  def create
    @product = @category.products.build(product_params)

    unless @product.save
      response.status = :bad_request
      render 'errors', locals: { errors: @product.errors }
    end
  end

  def update
    @product.update_attributes(product_params)

    unless @product.save
      response.status = :bad_request
      render 'errors', locals: { errors: @product.errors }
    end
  end

  def delete
    @product.destroy
    
    head :no_content
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :price,
      :description,
      :quantity,
      :shop_id,
      pictures: []
    )
  end
end
