class ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id]) if params[:category_id]

    @products = @category.products if @category
    @products ||= Product.all

    @products = @products.with_attached_image
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
  end
end