class CategoriesController < ApplicationController
  before_action :set_category, except: %i[index create]
  # def create
  #   @category = Category.new(category_params)
  #   if @category.save
  #     render(jsonapi: @category, status: :created)
  #   else
  #     render(json: @category.errors, status: :bad_request)
  #   end
  # end

  def index
    @categories = Category.all
    # render jsonapi: @categories
  end

  def show; end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
